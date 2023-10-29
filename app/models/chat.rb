class Chat < ApplicationRecord

  validates :user1, presence: true
  validates :user2, presence: true


  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'
  has_many :messages, dependent: :destroy
  def self.find_or_create_by_users(user1, user2)
    chat = where(user1_id: [user1.id, user2.id], user2_id: [user1.id, user2.id]).first

    unless chat
      chat = create!(user1_id: user1.id, user2_id: user2.id)
    end

    chat
  end
end