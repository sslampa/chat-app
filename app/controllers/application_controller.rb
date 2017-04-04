class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :show_messages
  # before_action :user_now

  private

    def show_messages
      @messages = Message.all
    end

    def user_now
      @some_id = current_user.id
    end
end
