class ApplicationController < ActionController::Base
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
end
