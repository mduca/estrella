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

		parameter_name = ""
		if is_zipcode? my_current_zipcode then
			#The user provided a zipcode.
			parameter_name = "zipCode"
		else
			#the user provided something
			#that is NOT a zipcode
			#use google's api to attempt to conver into zipcode


		end


		uri = URI.parse(base + "?format=json&auth_token=E564A05852E91F84037F1196E45BABC5&"+parameter_name+"="+my_current_zipcode + "&languages=" + my_language + parameters)

		response = Net::HTTP.get_response(uri)
		hash = JSON.parse response.body[13 .. -4]

		@results = hash["items"]
		@my_language = isolang2name(session[:locale])

		@my_current_zipcode = my_current_zipcode
		doc = I18n.t(:here_are_results)
		# "results for location %s and language %s "
		@results_message = sprintf(doc, @my_current_zipcode, @my_language)
	end

	def organization


	end
end
