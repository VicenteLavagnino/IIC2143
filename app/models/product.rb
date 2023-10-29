class Product < ApplicationRecord

  belongs_to :user, dependent: :destroy
  has_many :reviews, dependent: :destroy


  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :set, presence: true
end
