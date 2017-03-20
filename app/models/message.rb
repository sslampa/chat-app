class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  scope :display, -> { order(:created_at) }
end
