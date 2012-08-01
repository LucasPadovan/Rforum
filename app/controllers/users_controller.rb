class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create, :save]
  before_filter :authorize_admin, only: :destroy

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    #respond_to do |format|
      #format.html # show.html.haml
      #format.json { render json: @user }
    #end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    if current_user
      redirect_to( homepage_url, :notice => 'Ya estas registrado!!' )
    end
  end

  # GET /users/1/edit
  def edit
    is_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user_session = UserSession.new(params[:user])

    respond_to do |format|
      if @user.save && @user_session.save
        format.html { redirect_to homepage_url, notice: 'Usuario registrado satisfactoriamente' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    is_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Usuario actualizado!' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end


  private

  def is_user
    if User.exists?(params[:id])
      @user = User.find(params[:id]);
      if !current_user || current_user.id != @user.id
        redirect_to(homepage_url, :notice=>"No tienes permisos para acceder a esta pagina")
      end
    else
      redirect_to(homepage_url, :notice=>"No tienes permisos para acceder a esta pagina")
    end
  end
end