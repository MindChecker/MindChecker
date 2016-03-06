class Practitioner < ActiveRecord::Base
  geocoded_by :address
  before_save :geocode, if: ->(obj){ binding.pry;obj.address.present? and obj.address_changed? }
end
