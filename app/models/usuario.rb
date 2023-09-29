class Usuario < ApplicationRecord
  has_many:chatuser
  has_many:chat, :through => :chatuser
  has_many:product
end
