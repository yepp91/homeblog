class ApplicationController < ActionController::Base
  protect_from_forgery
  def is_admin
  	if !(current_user.try(:is_admin?))
  		flash[:error] = 'GTFO'
  		redirect_to :root
  	end
  end
end
