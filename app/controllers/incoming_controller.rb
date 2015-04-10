class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # You put the message-splitting and business
    # magic here.
    # Find the user using params[:sender]
    @user = User.find_by(email: params[:sender])
    # Find the topic by using params[:subject]
    @topic = Topic.find_by(email: params[:subject])

    # Assign the url to a variable after retrieving it from params["body-plain"]
    @url = params["body-plain"]
    # Check if user is nil, if so, create and save a new user
    if @user.nil?
      @user = User.new(email: params[:sender], password: "temp0rary_passw0rd")
      @use.skip_confirmation!
      @user.save!

    # Check if the topic is nil, if so, create and save a new topic
    if @topic.nil?
      @topic = @user.topics.create(title: params[:subject])
      @topic.save!
    end

    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    @bookmark = @topic.bookamarks.build(url: @url)
    @bookmark.save!

    # Assuming all went well
    head 200
  end
end