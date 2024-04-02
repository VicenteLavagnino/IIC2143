# frozen_string_literal: true

class User < ApplicationRecord
  # mount_uploader :profile_picture, ProfilePictureUploader

  has_many :chat, dependent: :destroy
  has_many :review, dependent: :destroy
  has_many :request, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
