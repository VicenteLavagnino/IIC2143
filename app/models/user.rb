class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :products
  has_many :requests
  has_many :chats, dependent: :destroy
  has_many :messages, through: :chats, dependent: :destroy

  validates_format_of :phone_number, with: /\A\+56 9 \d{4} \d{4}\z/, message: "debe estar en el formato +56 9 **** ****"

  has_many :user_reports
  before_save :set_admin_status

  def timeout_in
    if admin?
      15.minutes
    else
      Devise.timeout_in
    end
  end

  def set_admin_status
    self.admin = true if self.email == 'cris.dmaass@gmail.com'
  end

end
