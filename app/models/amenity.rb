class Amenity < ApplicationRecord
    has_many :property_amenities
    has_many :properties, through: :property_amenities

    def to_s 
        title 
    end
end
