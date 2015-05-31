require 'json' # for markers
require 'pp'  # for debugging
require 'open-uri' # for api request
require 'net/http' # I don't think we need this one.

class ResultsController < ApplicationController
	layout 'guided'
	before_filter :get_current_path

	# 
	# this functions takes EN and returns English
	# 
	def isolang2name(language)
		languages = {}
		languages['en']='English'
		languages['fr']='Français'
		languages['arb']='العراقية'
		languages['sq']='Albanian'
		languages['hy']='Հայերեն'
		languages['zh']='中国粤菜'
		languages['fa']='فارسی'
		languages['de']='Deutsche'
		languages['es']='Español'
		languages['ht']='Kreyòl ayisyen'
		languages['ja']='日本語'
		languages['ko']='한국어'
		languages['zh-tw']='中國'
		languages['cmn']='中国官话'
		languages['pa']='ਪੰਜਾਬੀ'
		languages['bs']='Srpsko-hrvatski'

		return languages[language]

	end

	# 
	# this functions takes EN and returns 1
	# or ES and returns 2
	# 
	def isolang2code(language)
		languages = {}
		languages['en']='1' # "English"
		languages['fr']='10' # "French"
		languages['arb']='107' # "Iraqi"
		languages['sq']='11' # "Albanian"
		languages['hy']='12' # "Armenian"
		languages['zh']='13' # "Cantonese Chinese"
		languages['fa']='16' # "Farsi"
		languages['de']='18' # "German"
		languages['es']='2' # "Spanish"
		languages['ht']='20' # "Haitian Creole"
		languages['ja']='25' # "Japanese"
		languages['ko']='27' # "Korean"
		languages['zh-tw']='3' # "Chinese"
		languages['cmn']='30' # "Mandarin Chinese"
		languages['pa']='33' # "Punjabi"
		languages['bs']='34' # "Serbo-Croatian"

		return languages[language]

	end

	# 
	# is_zipcode?
	#
	# validate if given information is zipcode
	# returns true on the following cases:
	# 
	# 00000-0000
	# 00000 0000
	# 00000 
	#
	# returns false otherwise.
	#
	def is_zipcode?(address_or_zipcode)
		/\d{5}(-| )\d{4}$|^\d{5}$/.match(address_or_zipcode) != nil
	end


	#convert query address into a zipcode.
	#
	#we need this when the user provided something
	#that is NOT a zipcode
	#uses google's api to attempt to conver text address into
	#gps location 

	# i.e: Berkeley, CA into 37.8715926,-122.272747

	def query_address2latlng(query_address)
		la_clave_esa = "AIzaSyBtlkF4i2Mmv33" + "uVc4aVTA5JT94-eEnRTo"
		geocode_url = "https://maps.googleapis.com/maps/api/geocode/json?address="+query_address+"&key=" + la_clave_esa
		geocode_uri = URI.parse(geocode_url)
		geocode_response = Net::HTTP.get_response(geocode_uri)
		geocode_hash = JSON.parse geocode_response.body
		#pp geocode_hash
		lat = geocode_hash["results"][0]["geometry"]["location"]["lat"]
		lng = geocode_hash["results"][0]["geometry"]["location"]["lng"]
		return lat.to_s + "," + lng.to_s
	end

	def index
		#Fetch zipcode from Session
		my_current_zipcode = session[:localization]
		my_language = isolang2code(session[:locale])
		base = "http://api.probono.net/legalorganizations/current"
		
		#TODO add legal areas and legal services.
		#
		#parameters = "legalAreas=" + session[:legalAreas]
		#parameters += "&legalServices=" +  session[:legalServices]

		parameters = ""
		
		#END TODO

		#hardcoded for how
		@latlng =  "37.7749295,-122.4194155"

		parameter_name = ""
		if is_zipcode? my_current_zipcode then
			#The user provided a zipcode.
			parameter_request = "zipCode=" + my_current_zipcode
		else
			query_address = URI::encode(my_current_zipcode + "," + session[:state])
			latlng = query_address2latlng(query_address)
			parameter_request = "gps=" + latlng
			#puts("lat:" + lat.to_s + " lng:" + lng.to_s)
		end

		uri = URI.parse(base + "?format=json&auth_token=E564A05852E91F84037F1196E45BABC5&"+parameter_request+"&languages=" + my_language + parameters)

		response = Net::HTTP.get_response(uri)
		hash = JSON.parse response.body[13 .. -4] # remove funcCall

		@results = hash["items"]
		@my_language = isolang2name(session[:locale])

		@my_current_zipcode = my_current_zipcode
		doc = I18n.t(:here_are_results)
		doc = fix_format_string(doc)
		# "results for location %s and language %s "
		@results_message = sprintf(doc, @my_current_zipcode, @my_language)

		@markers = []
		@results.each do |organization|
			rec = {}
			rec["name"] = organization["title"]
			rec["lon"] = organization["pbn:address"]["longitude"]
			rec["lat"] = organization["pbn:address"]["latitude"]
			rec["url"] = organization["link"]
			rec["phone"] = organization["pbn:contact"]["phone"]
			rec["email"] = organization["pbn:contact"]["email"]
			
			@markers << rec
		end

		#print markers
		#@markers << {"lon"=>-25.363882,"lat"=>131.044922,"name"=>"test"}
		#@markers << {"lon"=>-24.363882,"lat"=>131.044922,"name"=>"test"}
		#@markers << {"lon"=>-23.363882,"lat"=>131.044922,"name"=>"test"}
		#@markers << {"lon"=>-22.363882,"lat"=>131.044922,"name"=>"test"}
		@markers = @markers.to_json

	end

	# convert:
	# "results for location _ and language __ "
	# into
	# "results for location %s and language %s "
	#
	# we need this since google translate doesn't like %s and
	# will convert %s into whatever it thinks, anything, but %s
	# when translated in korean (KO) and other languages
	#
	def fix_format_string(fmt)
			fmt.gsub("__","%s").gsub("_","%s")
	end

	def organization


	end
end
