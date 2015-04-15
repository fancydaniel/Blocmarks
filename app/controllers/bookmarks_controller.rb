class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])

  end

  def create 
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was added"
      redirect_to @topic
    else
      flash[:error] = "There was an error saving your bookmark. Please try again."
      render :new
    end
  end

  def edit
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
