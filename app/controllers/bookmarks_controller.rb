class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @topic

  end

  def create 
    if params[:commit] == "Preview"
      @topic = Topic.friendly.find(params[:topic_id])
      redirect_to(topic_path(@topic, preview: params[:bookmark][:url]))
    else
      @topic = Topic.friendly.find(params[:topic_id])
      @bookmark = @topic.bookmarks.build(bookmark_params)
      @bookmark.user = current_user
      authorize @bookmark

      if @bookmark.save
        flash[:notice] = "Bookmark was added"
        redirect_to @topic
      else
        flash[:error] = "There was an error saving your bookmark. Please try again."
        render :new
      end
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

     if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Your bookmark has been updated"
      redirect_to @topic
    else
      flash[:error] = "Error saving bookmark. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      redirect_to @topic
      flash[:notice] = "Bookmark was deleted"
    else
      redirect_to @topic
      flash[:error] = "There was an error deleting your bookmark. Please try again."
    end

  end  

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
