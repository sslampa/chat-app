class Message < ApplicationRecord
  belongs_to :user, optional: true
  validates :content, presence: true
  scope :display, -> { order(:created_at) }
  after_create_commit{ MessageBroadcastJob.perform_later self }
end
