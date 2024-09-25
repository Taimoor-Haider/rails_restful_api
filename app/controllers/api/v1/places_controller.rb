class Api::V1::PlacesController < ApplicationController
  before_action :set_place, only: [:show, :update, :destroy]

  def index
    @places = Place.all
    render json: @places
  end

  def show
    render json: @place
  end

  def update
    if @place.update(place_params)
      render json: @place
    else
      render json: {error:@place.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      render json: @place, status: :created
    else
      render json: {error:@place.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @place.destroy
    render json: {success:true , message:"Place was successfully destroyed"}
  end

  private
  def place_params
    params.require(:place).permit(:name, :description, :longitude, :latitude, :city, :country, :image_url)
  end
  def set_place
    @place = Place.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    render json: {error: error.message}, status: :not_found
  end
end
