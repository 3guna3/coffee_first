class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :self_introduction, :img])
    devise_parameter_sanitizer.permit(:acount_update, keys: [:name, :self_introduction, :img])
  end
end
