class Session < ActiveRecord::Base

  geocoded_by :ip_address, :address, :longitude, :latitude
  after_validation :geocode

end
