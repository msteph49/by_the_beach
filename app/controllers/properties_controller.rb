class PropertiesController < ApplicationController
    before_action :authenticate_user!, except: %i[ index show ]
    def index
        @properties = Property.all
    end

    def new
        @property = Property.new
    end

    def show
        @property = Property.find_by(params[:id])
    end

    def create
        @property = current_user.properties.new(property_params)

        if @property.save 
            redirect_to @property, notice: "Saved!"
        else  
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @property = current_user.properties.find(params[:id])
    end

    def update
        @property = current_user.properties.find(params[:id])
        if @property.update(property_params) 
            redirect_to @property, notice: "Updated!"
        else  
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @property = current_user.properties.find(params[:id])
        @property.destroy
        redirect_to properties_path, notice: "Property Deleted"
    end

    private

    def property_params
        params.require(:property).permit(:street_address_1, :street_address_2,
        :city, :state, :zipcode, images: [], amenity_ids: [])
    end

end
