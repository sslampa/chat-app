class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! content: data['message'], origin: data['user']['room']
  end

  def start(data)
    ActionCable.server.broadcast 'room_channel', name: render_message(data['user'], User.find(data['user']).email)
  end

  private

    def render_message(user, email)
      ApplicationController.renderer.render(partial: 'users/add_user', locals: {user: user, email: email})
    end
end
