class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :symptoms])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :symptoms])
    devise_parameter_sanitizer.permit(:post_symptoms, keys: [:title, :age, :detail, :image1, :image2, :advice])
  end
end
