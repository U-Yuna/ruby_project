class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  helper_method :current_user

  def current_user
    Current.session&.user
  end

  def authenticate_user!
    #redirect_to login_path, alert: "ログインしてください" unless current_user
  end 

  allow_browser versions: :modern
end
