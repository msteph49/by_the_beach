class Property < ApplicationRecord
    belongs_to :user
    has_many :reviews
    validates :street_address_1, :city, :state, :zipcode, :images, presence: true

    has_many_attached :images
end
