class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
 
	def set_locale
	  I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
	end

	private

	def get_current_path

		if session[:path_id]
			@current_path = Path.find(session[:path_id])
		else
			redirect_to :root
		end

	end
end
