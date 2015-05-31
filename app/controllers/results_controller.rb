class ResultsController < ApplicationController
	layout 'guided'
	before_filter :get_current_path

	def index
		#Fetch rtl from Session

		uri = URI.parse("http://api.probono.net/legalorganizations/current?format=json&auth_token=E564A05852E91F84037F1196E45BABC5&langue")

		response = Net::HTTP.get_response(uri)
		hash = JSON.parse response.body[13 .. -4]

		@results = hash["items"]

	end

	def organization


	end
end
