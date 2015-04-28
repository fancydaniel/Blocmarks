class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :topics
  has_many :likes, dependent: :destroy
  has_many :liked_bookmarks, through: :likes, source: :bookmark
  # has_many :liked_topics, through: :liked_bookmarks, source: :topic
  has_many :bookmarks, dependent: :destroy

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end

  def liked_bookmarks_by_topic
    liked_bookmarks.chunk { |b| b.topic }
  end

  def bookmarks_by_topic
    bookmarks.chunk { |b| b.topic }
  end
  
end
