class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

	#Some languages read Right-to-left
	#and some languages read Left-to-right
	#this code accounts for such changes
	#including languages that are not yet supported
	#in the current scope.
	def self.site_direction(locale)
 		site_direction = "ltr"
	  rtl = ["arb","ar","arc","bcc","bqi","ckb","dv","fa","glk","he","qu","mzn","pnb","ps","sd","ug","ur","yi"]
		if rtl.include?(locale) then
			return "rtl"
		end
		site_direction
  end


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
