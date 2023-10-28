class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :products
  has_many :requests
  has_many :chats, dependent: :destroy
  has_many :messages, through: :chats, dependent: :destroy
end
