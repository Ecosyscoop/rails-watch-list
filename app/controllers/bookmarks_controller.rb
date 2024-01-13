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
  end

  # def destroy
  # end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
