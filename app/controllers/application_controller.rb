class ApplicationController < ActionController::Base
  helper Railsui::ThemeHelper
  before_action :set_championships

  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_championships
    @championships = Championship.all
  end

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end

  def ensure_admin_user!
    unless current_user&.admin?
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(root_path)
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :name, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :name, :first_name, :last_name])
  end

end
