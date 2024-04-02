class ApplicationController < ActionController::Base

  before_action :set_session_expiry

  def set_session_expiry
    request.session_options[:expire_after] = 15.minutes if current_user && current_user.admin?
  end

end
