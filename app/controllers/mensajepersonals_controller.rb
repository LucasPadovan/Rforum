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
    @messages = @mensajepersonal.messages.paginate :page =>params[:page], :order=>'created_at asc', :per_page=>15
    @mensajepersonal.estado = 2 unless @mensajepersonal.messages.last.user == get_usuario
    @mensajepersonal.save
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @mensajepersonal }
    end
  end

  # GET /mensajepersonals/new
  # GET /mensajepersonals/new.json
  def new
    @mensajepersonal = get_usuario.msjenviados.build(:destinatario_id => params[:destinatario_id])
    @message = @mensajepersonal.messages.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mensajepersonal }
    end
  end

  # POST /mensajepersonals
  # POST /mensajepersonals.json
  def create
    @mensajepersonal = Mensajepersonal.new(params[:mensajepersonal])
    @message = @mensajepersonal.messages.build(params[:message])
    @message.user = get_usuario
    @mensajepersonal.estado = 1

    respond_to do |format|
      if @mensajepersonal.save
        format.html { redirect_to @mensajepersonal,
                                  notice: 'Mensaje personal enviado' }
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
      if @mensajepersonal.update_attributes( params[:mensajepersonal] )
        format.html { redirect_to @mensajepersonal, notice: 'Mensajepersonal was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @mensajepersonal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensajepersonals/1
  # DELETE /mensajepersonals/1.json arreglar logica para cambiar el estado al querer borrar y que al otro le muestre los nuevos todavia
  def destroy
    @mensajepersonal = Mensajepersonal.find(params[:id])

    vinicial = valorestado = @mensajepersonal.estado

    if @mensajepersonal.destinatario == get_usuario
      valorestado = 10
    elsif @mensajepersonal.remitente == get_usuario
      valorestado = 20
    end

    @mensajepersonal.estado = valorestado

    if vinicial + valorestado == 30 || @mensajepersonal.remitente == @mensajepersonal.destinatario
      @mensajepersonal.destroy
    else
      @mensajepersonal.save
    end

    respond_to do |format|
      format.html { redirect_to recibidos_url }
      format.json { head :ok }
    end
  end

  #POST /conversations/reply
    def save_reply
      if Mensajepersonal.exists?(params[:id])
        @mensajepersonal = Mensajepersonal.find(params[:id])
        if @mensajepersonal.remitente == current_user
          @mensajepersonal.estado = 3 if @mensajepersonal.estado != 1
        elsif @mensajepersonal.destinatario == current_user
          @mensajepersonal.estado = 4 if @mensajepersonal.estado != 1
        end
        @message = @mensajepersonal.messages.build(params[:message])
        @message.user_id = current_user.id
        @message.mensajepersonal_id = @mensajepersonal.id
        @mensajepersonal.save
      end
      respond_to do |format|
        if current_user && @message.save
          format.html {redirect_to @mensajepersonal }
        else
          format.html {render :action => "new"}
        end
      end
    end

  def recibidos
    @recibidos = get_usuario.msjrecibidos.where( 'estado !=?', 10 )
  end

  def enviados
    @enviados = get_usuario.msjenviados.where( 'estado !=?', 20 )
  end
end