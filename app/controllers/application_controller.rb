class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :show_messages

  private

    def show_messages
      @messages = Message.all
    end
end
