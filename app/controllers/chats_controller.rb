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

  def show
    @chat = Chat.find(params[:id])
  end
end
