class Bookmark < ActiveRecord::Base
  require 'open-uri'
  validates :url, presence: true

  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  

  def self.new_with_image(params)
    bookmark = new
    preview = PreviewService.new(params[:url])
    bookmark.url = preview.site_url
    bookmark.image_url = preview.image_url
    bookmark
  end

end
