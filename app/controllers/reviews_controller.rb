class ReviewsController < ApplicationController
    before_action :set_property

    def index
        @reviews = @property.reviews.all
    end

    private 

    def set_property
        @property = Property.find(params[:property_id])
    end
end
