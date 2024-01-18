class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id]) # the creation is kept in the new form therefore need to bring list id up again
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  # No need for app/views/restaurants/destroy.html.erb
      redirect_to lists_path, status: :see_other
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
