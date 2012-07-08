class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize
  helper_method :current_user, :es_administrador, :get_usuario

  protected
  def authorize
    unless current_user
      redirect_to login_url, notice: "Por favor ingrese su usuario y contrasena para ver el contenido"
    end
  end

  def authorize_admin
    unless es_administrador
      redirect_to homepage_url, notice: "No tienes el rango adecuado para esta seccion"
    end
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user=current_user_session && current_user_session.record
  end

  def es_administrador
    if @current_user != nil
      @current_user.rango=="Administrador"
    else
      return false
    end
  end

  def get_usuario
    @current_user
  end
end
