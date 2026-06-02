class ChatsController < ApplicationController
  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(title: "No title")
    @chat.user = current_user

    if @chat.save
      redirect_to dashboard_path
    else
      render "dashboard"
    end
  end
end
