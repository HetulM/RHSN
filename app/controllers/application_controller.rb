class ApplicationController < ActionController::Base

  # The controller for the application, this contains the parameters which are allowed to be permitted by users 
  # when they sign up and update their account using devise. This contains the code for the cart so that it 
  # can be used throughout the application. 

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :current_cart

  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end
  # Allows us to access current_cart in the view files
  helper_method :current_cart

  private
  # Cart base code sourced from author: Baylor Breaks It Down.
  # https://www.youtube.com/watch?v=orDmqI-dlCo&t=14s
  def cart_token
    return @cart_token unless @cart_token.nil?

    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :username, :email, :password,
      :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :username, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }
  end
end
