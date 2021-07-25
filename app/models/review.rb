class Review < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :rating, presence: true

  validates :rating, numericality: {only_integer: true },
        inclusion: { in: 1..5, message: "must be within 1 to 5"}
end
