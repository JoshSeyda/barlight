class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def tender_authenticate
    authorize current_user, :tender?
  end

  private

  def user_not_authorized(exception)
    # Redirect to whatever page you want if not authorized
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first, :last, :role, :handle, location: [:address]])
  end
end
