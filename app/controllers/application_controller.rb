class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :name_zen_family, :name_zen_first, :name_han_family, :name_han_first, :birthday])
  end

end
