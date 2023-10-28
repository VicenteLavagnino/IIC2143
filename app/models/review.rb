class Review < ApplicationRecord

  validates :product, :content, :rate, presence: true
  belongs_to :Product
end
