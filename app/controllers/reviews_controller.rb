class ReviewsController < ApplicationController
    before_action :set_property
    before_action :authenticate_user!, only: [:index]

    def index
        @reviews = @property.reviews.all
    end

    def new
        @review = @property.reviews.new
    end

    def create
        @review = @property.reviews.new(review_params)
        @review.user = current_user

        if @review.save 
            redirect_to @property, notice: "Saved Review!"
        else  
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @review = current_user.reviews.find(params[:id])
    end

    def update
        @review = current_user.reviews.find(params[:id])
        if @review.update(review_params) 
            redirect_to @property, notice: "Updated Review!"
        else  
            render :edit, status: :unprocessable_entity
        end
    end

    private 

    def set_property
        @property = Property.find(params[:property_id])
    end

    def review_params
        params.require(:review).permit(:rating, :description)
    end
end
