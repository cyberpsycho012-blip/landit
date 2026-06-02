class MessagesController < ApplicationController
  SYSTEM_PROMPT = "I am a full stack developer looking for an entry level job in my field.\n\n
      You are an experienced HR professional, who specializes in tech recruiting.\n\n
      Give me recommendations on how to edit my resume, based on the job offer i provide.\n\n
      Provide step-by-step instructions in bullet points, using Markdown."
  def create
    @chat = current_user.chats.find(params[:chat_id])

    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      ruby_llm_chat = RubyLLM.chat
      response = ruby_llm_chat.with_instructions(SYSTEM_PROMPT).ask(@message.content)
      Message.create(role: "assistant", content: response.content, chat: @chat)

      redirect_to dashboard_path
    else
      render "dashboard", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
