class Bookmark < ActiveRecord::Base
  validates :url, presence: true
  before_validation :smart_add_url_protocol

  belongs_to :topic
  has_many :likes, dependent: :destroy

  protected

  def smart_add_url_protocol
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
      self.url = "http://#{self.url}"
    end
  end

end
