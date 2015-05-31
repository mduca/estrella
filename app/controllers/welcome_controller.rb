class WelcomeController < ApplicationController
	def lonlat2zipcode
		url = "http://maps.googleapis.com/maps/api/geocode/json?latlng=" +params["latlng"]+ "&sensor=true",
	
      render json: [[[0,1,2,3]]]
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
