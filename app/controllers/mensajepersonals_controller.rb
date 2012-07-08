class MensajepersonalsController < ApplicationController
  before_filter :authorize_admin, only: :index

  # GET /mensajepersonals
  # GET /mensajepersonals.json
  def index
    @mensajepersonals = Mensajepersonal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mensajepersonals }
    end
  end

  # GET /mensajepersonals/1
  # GET /mensajepersonals/1.json
  def show
    @mensajepersonal = Mensajepersonal.find(params[:id])

    if @mensajepersonal.estado== 1
      @mensajepersonal.estado = 2 if @mensajepersonal.destinatario == get_usuario
      @mensajepersonal.save
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mensajepersonal }
    end
  end

  # GET /mensajepersonals/new
  # GET /mensajepersonals/new.json
  def new
    @mensajepersonal = get_usuario.msjenviados.build(:destinatario_id => params[:destinatario_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mensajepersonal }
    end
  end

  # GET /mensajepersonals/1/edit
  #def edit
  #  @mensajepersonal = Mensajepersonal.find(params[:id])
  #end

  # POST /mensajepersonals
  # POST /mensajepersonals.json
  def create
    @mensajepersonal = get_usuario.msjenviados.build(params[:mensajepersonal])
    @mensajepersonal.estado = 1

    respond_to do |format|
      if @mensajepersonal.save
        format.html { redirect_to @mensajepersonal,
                                  notice: 'Mensaje personal creado' }
        format.json { render json: @mensajepersonal, status: :created, location: @mensajepersonal }
      else
        format.html { render action: "new" }
        format.json { render json: @mensajepersonal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mensajepersonals/1
  # PUT /mensajepersonals/1.json
  def update
    @mensajepersonal = Mensajepersonal.find(params[:id])

    respond_to do |format|
      if @mensajepersonal.update_attributes(params[:mensajepersonal])
        format.html { redirect_to @mensajepersonal, notice: 'Mensajepersonal was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @mensajepersonal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensajepersonals/1
  # DELETE /mensajepersonals/1.json
  def destroy
    @mensajepersonal = Mensajepersonal.find(params[:id])

    vinicial = valorestado = @mensajepersonal.estado

    if @mensajepersonal.destinatario == get_usuario
      valorestado=10
    elsif @mensajepersonal.remitente == get_usuario
      valorestado=20
    end

    @mensajepersonal.estado = valorestado

    if vinicial+valorestado == 30 || @mensajepersonal.remitente == @mensajepersonal.destinatario
      @mensajepersonal.destroy
    else
      @mensajepersonal.save
    end

    respond_to do |format|
      format.html { redirect_to recibidos_url }

      format.json { head :ok }
    end
  end

  def recibidos
    @recibidos= Mensajepersonal.where('destinatario_id =?',get_usuario).where('estado !=?',10)
  end

  def enviados
    @enviados = Mensajepersonal.where('remitente_id =?', get_usuario).where('estado !=?',20)
  end
end
