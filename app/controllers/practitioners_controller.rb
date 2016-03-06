class PractitionersController < ApplicationController
  def index
    postcode = params[:postcode]

    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{postcode}+UK&key=#{Rails.application.secrets.key_google_maps}"
    response = HTTParty.get(url, verify: false)
    coordinates = response["results"][0]["geometry"]["location"]
    distance = 2
    practitioners = Practitioner.all_near(coordinates, distance)[1..5]
    binding.pry
    respond_to do |format|
      format.json { render :json => practitioners.to_json }
    end
  end
end
