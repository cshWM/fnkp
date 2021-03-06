class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Por favor autentique-se"
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.tipo == 1
  end

  def association_user
    redirect_to(root_url) unless current_user.tipo == 2
  end

  def club_user
    redirect_to(root_url) unless current_user.tipo == 3
  end

# descomentar em produção
#  rescue_from ActiveRecord::RecordNotFound do |exception|
#    render_404
#  end

  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end

    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :status => :not_found, :layout => false }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end



end
