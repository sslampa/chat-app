class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :display_messages

  def create
    message = current_user.messages.build(message_params)
    if message.save
      redirect_to messages_url
    else
      render 'index'
    end
  end

  private
    def display_messages
      @messages = Message.display
      @message = current_user.messages.build
    end

    def message_params
      params.require(:message).permit(:content)
    end
end
