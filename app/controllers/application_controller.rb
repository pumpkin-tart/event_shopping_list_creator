class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :require_login
  add_flash_types :success, :info, :warning, :danger
  
  private
  
  def not_authenticated
    flash[:warning] = t('defaults.message.require_login')
    redirect_to login_path
  end
end
