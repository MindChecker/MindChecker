require 'json'

JSON.parse(open("#{Dir.pwd}/lib/tasks/gps.json").read).each do |gp|

  gp_as_json = {
    "name" => gp["OrganisationName"],
    "address" => "#{gp["Address1"]}, #{gp["Address2"]}, #{gp["City"]}, #{gp["Postcode"]}",
    "latitude" => gp["Latitude"],
    "longitude" => gp["Longitude"],
    "phone" => gp["Phone"],
    "email" => gp["Email"],
    "website" => gp["Website"]
  }

  Practitioner.create(gp_as_json)
end
