class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @chats = current_user.chats
    @message = Message.new
    @chat = if params[:chat_id].present?
              @chats.find(params[:chat_id])
            else
              @chats.last
            end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
