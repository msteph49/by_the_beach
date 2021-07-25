class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  has_many :properties, dependent: :destroy 
  has_many :reviews, dependent: :destroy 
  has_many :property_reviews, through: :reviews, source: :property

  def to_s
    name
  end
  
end

