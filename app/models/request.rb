class Request < ApplicationRecord
  belongs_to :product
  has_one :chat
  belongs_to :user
end
