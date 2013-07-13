require "httparty"

class HomeController < ApplicationController
  def index
  	@query = params["query"]
  	if @query 
  		if COMMUNITY_AREAS.include?(@query.downcase)
	  		@birth_rates = HTTParty.get(BIRTH_RATE_API_URL,
							:query => {:community_area_name => @query}
				).parsed_response.first
				@deaths = HTTParty.get(DEATH_API_URL,
							:query => {:community_area_name => @query}
				).parsed_response.first
	  	end

  	end
  end


  private

  	BIRTH_RATE_API_URL = "http://data.cityofchicago.org/resource/4arr-givg.json"
  	DEATH_API_URL = "http://data.cityofchicago.org/resource/bfhr-4ckq.json"
  	# TRULIA_KEY = "25xjt9ar8fkqpv4km2txfvyq"
  	# TRULIA_API_URL = "http://api.trulia.com/webservices.php?library=LocationInfo&function=
			# 								getNeighborhoodsInCity&city=Chicago&state=IL&apikey=#{TRULIA_KEY}"
  	
		COMMUNITY_AREAS = ['rogers park',
												'west ridge',
												'uptown',
												'lincoln square',
												'north center',
												'lake view',
												'lincoln park',
												'near north side',
												'edison park',
												'norwood park',
												'jefferson park',
												'forest glen',
												'north park',
												'albany park',
												'portage park',
												'irving park',
												'dunning',
												'montclaire',
												'belmont cragin',
												'hermosa',
												'avondale',
												'logan square',
												'humboldt park',
												'west town',
												'austin',
												'west garfield park',
												'east garfield park',
												'near west side',
												'north lawndale',
												'south lawndale',
												'lower west side',
												'loop',
												'near south side',
												'armour square',
												'douglas',
												'oakland',
												'fuller park',
												'grand boulevard',
												'kenwood',
												'washington park',
												'hyde park',
												'woodlawn',
												'south shore',
												'chatham',
												'avalon park',
												'south chicago',
												'burnside',
												'calumet heights',
												'roseland',
												'pullman',
												'south deering',
												'east side',
												'west pullman',
												'riverdale',
												'hegewisch',
												'garfield ridge',
												'archer heights',
												'brighton park',
												'mckinley park',
												'bridgeport',
												'new city',
												'west elsdon',
												'gage park',
												'clearing',
												'west lawn',
												'chicago lawn',
												'west englewood',
												'englewood',
												'greater grand crossing',
												'ashburn',
												'auburn gresham',
												'beverly',
												'washington heights',
												'mount greenwood',
												'morgan park',
												'o\'hare',
												'edgewater',
												'chicago']
		
end
