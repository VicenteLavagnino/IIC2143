class Request < ApplicationRecord
 
  validates :product, :description, :state, presence: true
  belongs_to :product
end
