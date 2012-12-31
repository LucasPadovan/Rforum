class BoardsController < ApplicationController
  def index
    @boards = Board.includes(conversations: [{comments: :user}])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boards }
    end
  end

  def show
    #TODO: incluir comentarios y usuarios de comentarios, ooo poner los comentarios en una consulta aparte.
    @board = Board.includes(conversations: [{comments: :user}, :user]).find(params[:id])
    @father = Board.find(@board.padre) unless @board.padre == 1
    @childrens = Board.find_all_by_padre(@board.id)

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @board }
    end
  end

  def new
    @board = Board.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @board }
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def create
    @board = Board.new(params[:board])

    respond_to do |format|
      if @board.save
        format.html { redirect_to boards_path, notice: 'Foro creado' }
        format.json { render json: @board, status: :created, location: @board }
      else
        format.html { render action: "new" }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @board = Board.find(params[:id])

    respond_to do |format|
      if @board.update_attributes(params[:board])
        format.html { redirect_to @board, notice: 'Foro actualizado' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy

    respond_to do |format|
      format.html { redirect_to boards_url }
      format.json { head :ok }
    end
  end
end
