class WelcomeController < ApplicationController

	# this route returns the google api results
	# for a request similar to this:
	# http://followestrella.co/api/lonlat2zipcode?latlng=37.865739,-122.260889
	# it should return an array like this:
	#{
	#   "results" : [
	#      {
	#         "address_components" : [
	#            {
	#               "long_name" : "2401-2423",
	#               "short_name" : "2401-2423",
	#               "types" : [ "street_number" ]
	#            },
	#            {
	#               "long_name" : "Haste Street",
	#               "short_name" : "Haste St",
	#               "types" : [ "route" ]
	#            },
	#            
	#            ...
	#
	# this api exists so that there is not a warning in javascript
	# due to cross-site-request problems.

	def lonlat2zipcode
		#if params["latlng"] == nil then
		#	return
		#end
		url = "http://maps.googleapis.com/maps/api/geocode/json?latlng=" +params["latlng"]+ "&sensor=true"
		uri = URI(url) 
		data = Net::HTTP.get(uri)
		render json: data
	end

  def index
		@site_direction = ApplicationController.site_direction(params[:locale])
		
	#  if session[:locale] == nil then
	#    session[:locale]=0
	#	else
	#    session[:locale] +=1 #params[:locale]
	#	end
  end
end
