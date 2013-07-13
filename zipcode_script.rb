require 'JSON'

json = File.read('zipcodes.json')
zips = JSON.parse(json)

zips["features"].each_with_index do |feature, index|
  file = File.open("./zipcodes/" + index.to_s + ".geojson", "w")

  file.puts('{
  "type": "FeatureCollection", "features": [')

  file.puts feature

  file.puts "]}"
end
