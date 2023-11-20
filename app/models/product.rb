class Product < ApplicationRecord

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :offers, dependent: :destroy


  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :set, presence: true
end
