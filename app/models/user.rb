class User < ApplicationRecord
  has_many :products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # app/models/user.rb
  validates_format_of :phone_number, with: /\A\+56 9 \d{4} \d{4}\z/, message: "debe estar en el formato +56 9 **** ****"

  def timeout_in
    if admin?
      1.minutes
    else
      Devise.timeout_in
    end
  end

end
