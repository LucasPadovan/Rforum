class UserSessionsController < ApplicationController
  skip_before_filter :authorize
  # GET /user_sessions
  # GET /user_sessions.json
  #def index
    #@user_sessions = UserSession.all

    #respond_to do |format|
      #format.html # index.html.erb
      #format.json { render json: @user_sessions }
    #end
  #end

  # GET /user_sessions/1
  # GET /user_sessions/1.json
  #def show
    #@user_session = UserSession.find(params[:id])

    #respond_to do |format|
      #format.html # show.html.erb
      #format.json { render json: @user_session }
    #end
  #end

  # GET /user_sessions/new
  # GET /user_sessions/new.json
  def new
    @user_session = UserSession.new

    #respond_to do |format|
      #format.html # new.html.erb
      #format.json { render json: @user_session }
    #end
  end

  # POST /user_sessions
  # POST /user_sessions.json
  def create
    @user_session = UserSession.new(params[:user_session])

    #respond_to do |format|
      #if @user_session.save
        #format.html { redirect_to :users, notice: 'Logueado satisfactoriamente' }
        #format.json { render json: @user_session, status: :created, location: @user_session }
      #else
        #format.html { render action: "new" }
        #format.json { render json: @user_session.errors, status: :unprocessable_entity }
      #end
    #end
    if @user_session.save
      redirect_to(homepage_url, :notice=>"Ingreso satisfactorio!")
    else
      render :action =>"new"
    end

  end

  # PUT /user_sessions/1
  # PUT /user_sessions/1.json
  #def update
    #@user_session = UserSession.find(params[:id])

    #respond_to do |format|
      #if @user_session.update_attributes(params[:user_session])
        #format.html { redirect_to @user_session, notice: 'User session was successfully updated.' }
        #format.json { head :ok }
      #else
        #format.html { render action: "edit" }
        #format.json { render json: @user_session.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.json
  def destroy
    @user_session = UserSession.find
    @user_session.destroy

    #respond_to do |format|
      #format.html { redirect_to :users, notice: 'Goodbye!'}
      #format.json { head :ok }
    #end
    redirect_to(homepage_url, :notice=>'Jaa nee')
  end
end
