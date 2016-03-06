class PractitionersController < ApplicationController
  def index
    postcode = params[:postcode]
    binding.pry
    lat_lng = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{postcode}&key=#{Rails.application.secrets.key_google_maps}")
    
    respond_to do |format|
      format.json { render :json => postcode.to_json }
    end
  end
end
