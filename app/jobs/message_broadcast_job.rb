class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
    ActionCable.server.broadcast 'room_channel', message: render
  end

  private

    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
    end

    def render_dash_message(message)
      ApplicationController.renderer.render(partial: 'users/message', locals: {message: message})
    end
end
