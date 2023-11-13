class User < ApplicationRecord
  has_many :products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  has_many :products
  has_many :requests
  #has_many :chats
  #has_many :messages, through: :chats, dependent: :destroy
  validates_format_of :phone_number, with: /\A\+56 9 \d{4} \d{4}\z/, message: "debe estar en el formato +56 9 **** ****", on: :update

  has_many :user_reports

  before_save :set_admin_status

  has_many :chats_as_user1, class_name: 'Chat', foreign_key: 'user1_id', dependent: :destroy
  has_many :chats_as_user2, class_name: 'Chat', foreign_key: 'user2_id', dependent: :destroy

  def all_messages
    Message.joins(:chat).where("chats.user1_id = ? OR chats.user2_id = ?", id, id)
  end

  def timeout_in
    if admin?
      15.minutes
    else
      Devise.timeout_in
    end
  end

  def set_admin_status
    self.admin = true if ['cris.dmaass@gmail.com', 'vicente.lavagnino@uc.cl', 'leo.feo@gmail.com'].include?(self.email)
  end
end

