class Product < ApplicationRecord

  validates :name, :description, :image, :set,:user, presence: true
  
  belongs_to :user, dependent: :destroy
end
