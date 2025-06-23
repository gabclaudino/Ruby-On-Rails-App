class ApplicationController < ActionController::Base
  include Pundit

  # opcional: captura exceções e redireciona
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Acesso negado."
    redirect_to(request.referer || root_path)
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || pessoas_path
  end

end
