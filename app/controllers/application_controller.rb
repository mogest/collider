class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :redirect_if_not_google_authenticated

  protected

  def current_user
    @__current_user ||= current_account.users.find_or_create_by!(email: google_auth_data.email)
  end

  def current_account
    Account.first!
  end

  helper_method :current_user
end
