class MessagesController < ApplicationController
  def create
    @chat = current_user.chats.find(params[:chat_id])
    # @resumes = current_user.resumes

    embedding = RubyLLM.embed(params[:message][:content])
    resumes = Resume.nearest_neighbors(:embedding, embedding.vectors, distance: "euclidean").first(1)
    @instructions = system_prompt
    @instructions += resumes.map { |resume| resume_prompt(resume) }.join("\n\n")

    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      @assistant_message = @chat.messages.create(role: "assistant", content: "")

      response = ask_llm
      @assistant_message.update(content: response.content)
      broadcast_replace(@assistant_message)

      @chat.generate_title_from_first_message

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to chat_path(@chat) }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            "new_message_container",
            partial: "messages/form",
            locals: { chat: @chat, message: @message }
          )
        end
        format.html { render "chats/show", status: :unprocessable_entity }
      end
    end
  end

  private

  def ask_llm
    @ruby_llm_chat = RubyLLM.chat

    build_conversation_history

    @ruby_llm_chat.with_tool(SearchResumesTool)
    @ruby_llm_chat.with_tool(CreateLlmResumeTool.new(user: current_user))
    @ruby_llm_chat.with_instructions(@instructions)

    @ruby_llm_chat.ask(@message.content) do |chunk|
      next if chunk.content.blank?

      @assistant_message.content += chunk.content
      broadcast_replace(@assistant_message)
    end
  end

  def broadcast_replace(message)
    Turbo::StreamsChannel.broadcast_replace_to(
      @chat,
      target: helpers.dom_id(message),
      partial: "messages/message", locals: { message: message }
    )
  end

  def build_conversation_history
    @chat.messages.each do |message|
      next if message.content.blank?

      @ruby_llm_chat.add_message(role: message.role.to_sym, content: message.content)
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def resume_prompt(resume)
    "Resume name: #{resume.name} Education: #{resume.education}
    Languages: #{resume.languages} Main Teach Skill: #{resume.main_tech_skill}
    Secondary Tech Skill: #{resume.secondary_tech_skills}
    Soft Skill: #{resume.soft_skills} Years of Experiance: #{resume.years_of_experience}
    Work Experiance: #{resume.work_experiences}, url: #{resume_url(resume)} ."
  end

  def system_prompt
    "Act as a professional HR recruiter and resume reviewer.
    Analyze the candidate's resume and provide specific recommendations to improve it for professional hiring standards.

    Your task is to answer questions about the resumes and recommend the most relevant one and explain why.
    Always share the name of a resume as clickable link with URL.

    Focus on experience, skills, achievements, education, formatting, keywords, and overall impact.

    Resume:
    Name: [NAME]
    Education: [EDUCATION]
    Languages: [LANGUAGES]
    Technical Skills: [TECHNICAL_SKILLS]
    Additional Skills: [ADDITIONAL_SKILLS]
    Soft Skills: [SOFT_SKILLS]
    Work Experience: [WORK_EXPERIENCE]
    Years of Experience: [YEARS_OF_EXPERIENCE]

    Instructions:
    Identify missing information, weak sections, and opportunities to strengthen the resume.
    Suggest improvements that would make the resume more attractive to recruiters and hiring managers.
    Prioritize measurable achievements, relevant skills, and professional presentation.Do not rewrite the entire resume.
    Do not explain your reasoning.

    You have access to tools:
    - Search resumes by keyword in name, work_experiences or main_tech_skill when a user asks.
    - Create a modified llm version of the resume for the current user on a given resume. Do not create multiple resumes.

    Output:
    Return only concise Markdown bullet points.
    Maximum 5 recommendations.
    Each recommendation must be specific and actionable."
  end
end
