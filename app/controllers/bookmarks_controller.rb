class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.new
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    # @bookmark.movie = @bookmark
    @bookmark.save
    # raise
    redirect_to list_path(@list)
  end

  def destroy
    # @list = List.find(params[:list_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    # redirect_to
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end



class ReviewsController < ApplicationController
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end
end
