class Property < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :property_amenities
    has_many :amenities, through: :property_amenities
    validates :street_address_1, :city, :state, :zipcode, :images, presence: true

    has_many_attached :images
end
