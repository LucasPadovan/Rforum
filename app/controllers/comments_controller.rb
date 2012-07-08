class CommentsController < ApplicationController
  before_filter :authorize_admin
  skip_before_filter :authorize_admin, only: [:edit, :update, :votar]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.paginate :page =>params[:page], :order=>'created_at desc', :per_page=>20

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Has comentado el tema ' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to board_conversation_path(:board_id=>@comment.conversation.board,
                                                          :id=>@comment.conversation)+u_pagina(@comment.conversation), notice: 'Comentario modificado' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :ok }
    end
  end

  def votar
    @comentario = Comment.find(params[:comentario_id])

    params[:negativo].present? ? (get_usuario.dislikes @comentario) : (get_usuario.likes @comentario)
    totalvotos= @comentario.likes.count-@comentario.dislikes.count
    render :js => "$('#totalVotos"+@comentario.id.to_s+"').html("+totalvotos.to_s+")"

  end

  private

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
