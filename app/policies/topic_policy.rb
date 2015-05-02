class TopicPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @topic = topic
  end

  def update?
    user.admin? or not topic.published?
  end

end