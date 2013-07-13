require 'JSON'

json = File.read('zipcodes.json')
zips = JSON.parse(json)

zips["features"].each_with_index do |element, index|
  file = File.open("./zipcodes/" + element["properties"]["ZIP"] + ".geojson", "w")

  file.puts('{
  "type": "FeatureCollection", "features": [')

  file.puts element.to_json

  file.puts "]}"
end
