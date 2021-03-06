class LikesController < ApplicationController


  def create
  @bookmark = Bookmark.find(params[:bookmark_id])
  like = current_user.likes.build(bookmark: @bookmark)

  authorize @bookmark

  if like.save
    # Add code to generate a success flash and redirect to @bookmark
    flash[:notice] = "Your like was recorded"
    redirect_to @bookmark.topic

  else
    # Add code to generate a failure flash and redirect to @bookmark
    flash[:notice] = "Your like was not recorded. Please try again."
    redirect_to @bookmark.topic
  end
end

  def destroy
    # Get the bookmark from the params
    # Find the current user's like with the ID in the param
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = Like.find(params[:id])
    authorize like

    if like.destroy
      # Flash success and redirect to @bookmark
      flash[:notice] = "Your like was removed"
      redirect_to @bookmark.topic
    else
      # Flash error and redirect to @bookmark
      flash[:notice] = "There was an error. Please try again."
      redirect_to @bookmark.topic
    end
  end

end
