class Vaccine < ApplicationRecord

    belongs_to :person
    validates :vaccine_type, :vaccine_date, presence: true

end
 