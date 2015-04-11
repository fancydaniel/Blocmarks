class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    # @bookmark = Bookmark.find(params[:id])
    # @bookmarks = @topic.bookmark
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:title))
    if @topic.save
      flash[:notice] = "Topic was saved"
      redirect_to @topic
    else
      flash[:error] = "There was an error saving your topic. Please try again."
      render :new
    end
  end

  def edit
  end
end
