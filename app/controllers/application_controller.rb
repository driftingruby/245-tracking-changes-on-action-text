class ApplicationController < ActionController::Base
  around_action :user_for_version

  private

  def user_for_version
    CurrentScope.user = current_user if user_signed_in?
    yield
  end
end
