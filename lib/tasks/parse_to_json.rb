require 'csv'
require 'json'

Dir.chdir("#{Dir.pwd}/lib/tasks/")
gps = CSV.read('GP.csv')

labels_in_string_form = gps[0][0]
labels_in_array_form = labels_in_string_form.split("\t")

results = []
gps.each_with_index do |line, i|
  next if i == 0
  record_in_array_form = line[0].split("\t")
  result = {}
  record_in_array_form.each_with_index do |cell, i|
    result[labels_in_array_form[i]] = cell
  end
  results << result
end

File.open('gps.json', 'w') do |f|
  f.puts results.to_json
end
