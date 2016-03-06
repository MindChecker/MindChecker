class PractitionersController < ApplicationController
  def index
    postcode = params[:postcode]

    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{postcode}+UK&key=#{Rails.application.secrets.key_google_maps}"
    response = HTTParty.get(url, verify: false)
    coordinates = response["results"][0]["geometry"]["location"]
    distance = 5

    binding.pry
    @practitioners = Practitioner.near([coordinates["lat"].to_f, coordinates["lng"].to_f], distance)

    respond_to do |format|
      format.json { render :json => coordinates.to_json }
    end
  end
end
