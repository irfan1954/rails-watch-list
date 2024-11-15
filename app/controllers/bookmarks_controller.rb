class BookmarksController < ApplicationController
  before_action :set_list, only: [:create, :new]

  def new
    # @bookmark = Bookmark.find(params[:list_id, :movie_id])
    @bookmark = Bookmark.new
    redirect_to new_list_path(@bookmark.list_id), status: :see_other
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to movies_path(@bookmark.movie), status: :see_other
  end


  private

  # def set_movie
  #   @movie = Movie.find(params[:movie_id])
  # end

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
