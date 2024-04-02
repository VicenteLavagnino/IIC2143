# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :requests, dependent: :destroy
  has_many :review, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  validates :name, presence: true
end
