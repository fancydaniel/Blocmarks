class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @bookmarks_by_topic = @user.bookmarks_by_topic
    @liked_bookmarks_by_topic = @user.liked_bookmarks_by_topic
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # Tell the Usermailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver_late

        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end