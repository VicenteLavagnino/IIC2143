class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :exchange, dependent: :destroy
end
