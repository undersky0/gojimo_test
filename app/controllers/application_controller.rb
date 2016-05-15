class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from JSON::ParserError, with: :record_not_found

  def record_not_found
    flash.now[:notice] =  "Ooops No Data Found"
    render(:file => 'public/500.html', :layout => true, :status => 500)
  end 
end
