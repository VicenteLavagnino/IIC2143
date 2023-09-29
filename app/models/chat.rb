class Chat < ApplicationRecord
  belongs_to :request
  has_many :chatuser
  has_many :usuario, :through => :chatuser
end
