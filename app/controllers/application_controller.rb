class ApplicationController < ActionController::Base
  before_action :set_locale
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options(options={})
    { locale: I18n.locale }
  end
  
  def authenticate_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = I18n.t 'account.unauthorized'
      redirect_to root_path
    end
  end
  
  protected 
  
  def devise_parameter_sanitizer
    if resource_class == User
      UserParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end
  
end
