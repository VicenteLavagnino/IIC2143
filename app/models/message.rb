class Message < ApplicationRecord

  validates :content, :user, :chat, presence: true
    belongs_to :user
    belongs_to :chat
  end
  