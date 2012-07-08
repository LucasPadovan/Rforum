class ConversationsController < ApplicationController
  before_filter :load_board
  before_filter :authorize_admin, only: :index

  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conversations }
    end
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
    @conversation = Conversation.find(params[:id])
    @primercomentario = @conversation.comments.first

    @otroscomentarios = @conversation.comments.paginate :page =>params[:page], :order=>'created_at asc', :per_page=>15

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conversation }
    end
  end

   # GET /conversations/new

  def new
    @conversation = Conversation.new
    @comment = @conversation.comments.build

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @conversation }
    end
  end


  # GET /conversations/1/edit
  def edit
    @conversation = Conversation.find(params[:id])
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new(params[:conversation])
    @comment = @conversation.comments.build(params[:comment])
    @conversation.user_id = @comment.user_id = current_user.id
    @conversation.board = @board

    respond_to do |format|
      if current_user && @conversation.save
        format.html { redirect_to board_path(@board), notice: 'Tu tema ha sido creado' }
        #format.json { render json: @conversation, status: :created, location: @conversation }
      else
        format.html { render action: "new" }
        #format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conversations/1
  # PUT /conversations/1.json
  def update
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      if @conversation.update_attributes(params[:conversation])
        format.html { redirect_to @conversation, notice: 'El tema fue actualizado' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy

    respond_to do |format|
      format.html { redirect_to board_path(@board) }
      format.json { head :ok }
    end
  end

  #GET /conversations/reply
  def reply
    @conversation=Conversation.find(params[:id])
    @comment = @conversation.comments.build

    respond_to do |format|
      format.html #reply.html.erb
    end
  end

  #POST /conversations/reply
  def save_reply
    if !current_user
      redirect_to(:login,:notice => "Por favor ingresa antes de comentar")
      return 1;
    end

    if Conversation.exists?(params[:id])
      @conversation = Conversation.find(params[:id])
      @comment=@conversation.comments.build(params[:comment])
      @comment.user_id = current_user.id
    else
      redirect_to(boards_path, :notice => "Especifique un foro valido")
    end

    respond_to do |format|
      if current_user && @comment.save
        format.html {redirect_to(board_conversation_path(:board_id=>@conversation.board, :id=>@conversation)+u_pagina(@conversation)+"#fondo",
                                 :notice =>"Tu respuesta fue agregada")}
      else
        format.html {render :action => "new"}
      end
    end
  end

  private

  def load_board
    if Board.exists?(params[:board_id])
      @board = Board.find(params[:board_id]);
    end

    unless @board
      redirect_to(boards_path, :notice => "Especifique un foro valido")
    end
  end

def u_pagina(c)
  numerocomentarios = c.comments.count
  retorno=""
  Integer n = 0
  if numerocomentarios > 15
    unless numerocomentarios%15 == 0
      n = 1
    end

    n += numerocomentarios/15
    n = String(n)
    retorno="?page="+n
  else
    retorno
  end
end

end
