
class LocationsController < ApplicationController
  include HTTParty
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def new
    @location = Location.new
  end

  def create
    @location = Geocoder.search(location_params[:address]).first
    @sunlight_response = HTTParty.get('https://congress.api.sunlightfoundation.com/legislators/locate',
                                      query: {latitude: @location.latitude, longitude: @location.longitude},
                                      headers: {"X-APIKEY" => "c31f9f2742674a9f8ee4e48183d8378e"})
    @legislators = @sunlight_response['results']
    render :'legislators/index'
  end

  private

  def location_params
    params.require(:location).permit(:address, :latitude, :longitude)
  end

end
