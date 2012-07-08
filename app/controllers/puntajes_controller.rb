class PuntajesController < ApplicationController
  # GET /puntajes
  # GET /puntajes.json
  def index
    @puntajes = Puntaje.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @puntajes }
    end
  end

  # GET /puntajes/1
  # GET /puntajes/1.json
  def show
    @puntaje = Puntaje.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @puntaje }
    end
  end

  # GET /puntajes/new
  # GET /puntajes/new.json
  def new
    @puntaje = Puntaje.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @puntaje }
    end
  end

  # GET /puntajes/1/edit
  def edit
    @puntaje = Puntaje.find(params[:id])
  end

  # POST /puntajes
  # POST /puntajes.json
  def create
    @puntaje = Puntaje.new(params[:puntaje])

    respond_to do |format|
      if @puntaje.save
        format.html { redirect_to @puntaje, notice: 'Puntaje was successfully created.' }
        format.json { render json: @puntaje, status: :created, location: @puntaje }
      else
        format.html { render action: "new" }
        format.json { render json: @puntaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /puntajes/1
  # PUT /puntajes/1.json
  def update
    @puntaje = Puntaje.find(params[:id])

    respond_to do |format|
      if @puntaje.update_attributes(params[:puntaje])
        format.html { redirect_to @puntaje, notice: 'Puntaje was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @puntaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puntajes/1
  # DELETE /puntajes/1.json
  def destroy
    @puntaje = Puntaje.find(params[:id])
    @puntaje.destroy

    respond_to do |format|
      format.html { redirect_to puntajes_url }
      format.json { head :ok }
    end
  end

end
