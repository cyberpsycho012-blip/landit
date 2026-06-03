class MessagesController < ApplicationController
  SYSTEM_PROMPT = "I am a full stack developer looking for an entry level job in my field.\n\n
                  You are an experienced HR professional, who specializes in tech recruiting.\n\n
                  Give me recommendations on how to edit my resume, based on the job offer i provide. \n\n
                  Provide short instructions in bullet points, using Markdown. Keep it to 3 suggestions"
  def create
    @chat = current_user.chats.find(params[:chat_id])
    @resumes = current_user.resumes

    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      @ruby_llm_chat = RubyLLM.chat
      build_conversation_history
      response = @ruby_llm_chat.with_instructions(instructions).ask(@message.content)

      @assistant_message = @chat.messages.create(role: "assistant", content: response.content)
      @chat.generate_title_from_first_message

      respond_to do |format|
        format.turbo_stream # renders `app/views/messages/create.turbo_stream.erb`
        format.html { redirect_to chat_path(@chat) }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("new_message_container", partial: "messages/form",
                                                                            locals: { chat: @chat, message: @message })
        end
        format.html { render "chats/show", status: :unprocessable_entity }
      end
    end
  end

  private

  def build_conversation_history
    @chat.messages.each do |message|
      @ruby_llm_chat.add_message(role: message.role.to_sym, content: message.content)
    end
  end

  def resumes_contex
    my_resumes = ""
    @resumes.each do |resume|
      my_resumes += "
        Resume name: #{resume.name}
        Education: #{resume.education}
        Languages: #{resume.languages}
        Main Teach Skill: #{resume.main_tech_skill}
        Secondary Tech Skill: #{resume.secondary_tech_skills}
        Soft Skill: #{resume.soft_skills}
        Years of Experiance: #{resume.years_of_experience}
        Work Experiance: #{resume.work_experiences}."
    end
    "Here are my resumes: #{my_resumes}."
  end

  def instructions
    [SYSTEM_PROMPT, resumes_contex].compact.join("\n\n")
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
