class Property < ApplicationRecord
    belongs_to :user

    validates :street_address_1, :city, :state, :zipcode, presence: true


end
