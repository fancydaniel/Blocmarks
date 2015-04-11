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

    # redirect_to @topic
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user

    if @topic.save
      flash[:notice] = "Topic was saved"
      redirect_to topics_path
    else
      flash[:error] = "There was an error saving your topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
      redirect_to topics_path
      flash[:notice] = "Your topic has been updated"
    else
      flash[:error] = "Error saving topic. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      redirect_to topics_path
      flash[:notice] = "Topic was deleted"
    else
      redirect_to topic_user
      flash[:error] = "There was an error deleting your topic. Please try again."
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
