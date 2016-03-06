require 'json'
require 'pry'

JSON.parse(open("/Users/claudiocarmeli/projects/NHS_app/lib/tasks/gps.json").read).each do |gp|
  
  gp_as_json = {}
  gp_as_json["name"] = gp["OrganisationName"]
  address = "#{gp["Address1"]}, #{gp["Address2"]}, #{gp["Address3"]}, #{gp["City"]}, #{gp["County"]}, #{gp["Postcode"]}"
  gp_as_json["address"] = address
  gp_as_json["phone"] = gp["Phone"]
  gp_as_json["email"] = gp["Email"]
  gp_as_json["website"] = gp["Website"]
  binding.pry
  practitioner = Practitioner.new(gp_as_json)
  practitioner.save
end
