class Bookmark < ActiveRecord::Base
  require 'open-uri'
  validates :url, presence: true

  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  

  def self.add_image(params)
    bookmark = new(params)
    preview = PreviewService.new(params[:url])
    # bookmark.title = preview.title
    bookmark.image_url = preview.image_url
    bookmark
  end

end
