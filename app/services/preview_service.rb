class PreviewService

  class InvalidURLError < StandardError
  end

  attr_accessor :site_url

  def initialize(site_url)
    @site_url = site_url
    @thumbnail = LinkThumbnailer.generate(site_url)
  rescue LinkThumbnailer::BadUriFormat
    raise InvalidURLError
  end

  def image_url
    @thumbnail.images.first.src.to_s
  end

  def title
    @thumbnail.title
  end
end