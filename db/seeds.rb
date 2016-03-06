require 'json'

Practitioner.destroy_all
SupportGroup.destroy_all

json_file = open("#{Dir.pwd}/lib/tasks/support_groups.json").read

JSON.parse(json_file)["support_groups"].each do |support_group|

  support_group_as_json = {
    "name" => support_group["name"],
    "phone" => support_group["tel"],
    "address" => "#{support_group["address"]}, #{support_group["address1"]}, #{support_group["postcode"]}",
    "latitude" => support_group["lat"],
    "longitude" => support_group["long"]
  }

  Practitioner.create(support_group_as_json)
end

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
