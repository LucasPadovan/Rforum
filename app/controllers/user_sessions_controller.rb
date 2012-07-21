class UserSessionsController < ApplicationController
  skip_before_filter :authorize

  # GET /user_sessions/new
  # GET /user_sessions/new.json
  def new
    @user_session = UserSession.new
  end

  # POST /user_sessions
  # POST /user_sessions.json
  def create
    @user_session = UserSession.new( params[:user_session] )
    if @user_session.save
      redirect_to( homepage_url, :notice => "Ingreso satisfactorio!" )
    else
      render :action => "new"
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.json
  def destroy
    @user_session = UserSession.find
    @user_session.destroy

    redirect_to( homepage_url )
  end
end