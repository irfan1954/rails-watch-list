class ListsController < ApplicationController

  before_action :set_bookmark, only: [:create]
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end


  def create
    @list = List.new(list_params)
    @list.bookmark = @bookmark
    if @list.save
      redirect_to bookmark_path(@bookmark)
    else
      render :new, status: :unprocessable_entity
    end
  end



  private

  def list_params
    params.require(:list).permit(:name, :bookmark_id)
  end

end