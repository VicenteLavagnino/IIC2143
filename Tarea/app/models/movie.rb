class Movie < ApplicationRecord
  #asociaciones
  belongs_to :director

  #validaciones
  validates :title, presence: true
  validates :sinopsis, presence: true
  validates :duration, presence: true
  validates :premiere, presence: true
  validates :director, presence: true

end
