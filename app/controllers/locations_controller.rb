class LocationsController < ApplicationController
  include HTTParty

  def search
    if location_params[:address] == "use my IP please!!!"
      location = Geocoder.coordinates(remote_ip)
      latitude = location[0]
      longitude = location[1]
      api_response(latitude, longitude)
    elsif location_params[:address].empty?
      @error = "Please enter a valid address."
      render 'new'
    else
      location = Geocoder.search(location_params[:address]).first
      api_response(location.latitude, location.longitude)
    end
  end

  private

  def location_params
    params.permit(:address, :latitude, :longitude)
  end
end
