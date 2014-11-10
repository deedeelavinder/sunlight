class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      '12.345.678.90'
    else
      request.remote_ip
    end
  end

  def api_response(latitude, longitude)
    @sunlight_response = HTTParty.get('https://congress.api.sunlightfoundation.com/legislators/locate',
                                      query: {latitude: latitude, longitude: longitude},
                                      headers: {"X-APIKEY" => "c31f9f2742674a9f8ee4e48183d8378e"})
    @legislators = @sunlight_response['results']
    render :'legislators/index'
  end
end
