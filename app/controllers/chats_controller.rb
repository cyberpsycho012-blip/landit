class ChatsController < ApplicationController
  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(title: Chat::DEFAULT_TITLE)
    @chat.user = current_user

    if @chat.save
      redirect_to dashboard_path
    else
      render "dashboard"
    end
  end

  def destroy
    @chats = current_user.chats
    @chat = if params[:chat_id].present?
              @chats.find(params[:chat_id])
            else
              @chats.last
            end

    @chat.destroy
    redirect_to dashboard_path
  end

  def show
    @chat = Chat.find(params[:id])
  end
end
