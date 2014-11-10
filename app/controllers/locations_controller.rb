
class LocationsController < ApplicationController
  include HTTParty
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def new
  end

  def search
    location = Geocoder.search(location_params[:address]).first
    if location.nil?
      @error = "Please enter a valid address."
      render 'new'
    elsif location_params.empty?
      @error = "Please enter a valid address."
      render 'new'
    else
      @sunlight_response = HTTParty.get('https://congress.api.sunlightfoundation.com/legislators/locate',
                                        query: {latitude: location.latitude, longitude: location.longitude},
                                        headers: {"X-APIKEY" => "c31f9f2742674a9f8ee4e48183d8378e"})
      @legislators = @sunlight_response['results']
      render :'legislators/index'
    end
  end

  # def search
  #   location = Geocoder.search(location_params[:address]).first
  #   unless location.nil?
  #     @sunlight_response = HTTParty.get('https://congress.api.sunlightfoundation.com/legislators/locate',
  #                                       query: {latitude: location.latitude, longitude: location.longitude},
  #                                       headers: {"X-APIKEY" => "c31f9f2742674a9f8ee4e48183d8378e"})
  #     @legislators = @sunlight_response['results']
  #     render :'legislators/index'
  #   else
  #     @error = "Please enter a valid address."
  #     render 'new'
  #   end
  # end

  private

  def location_params
    params.permit(:address, :latitude, :longitude)
  end

end
