class WelcomeController < ApplicationController
  def index
		@site_direction = ApplicationController.site_direction(params[:locale])
		
	#  if session[:locale] == nil then
	#    session[:locale]=0
	#	else
	#    session[:locale] +=1 #params[:locale]
	#	end
  end
end
