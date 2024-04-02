class Director < ApplicationRecord

    #asociaciones
    has_many :movies, dependent: :destroy
    has_many :rankings, dependent: :destroy

    #validaciones
    validates :name, presence: true
    validates :age, presence: true
    validates :country, presence: true
    validates :has_oscars, presence: true
end
