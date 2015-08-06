class PreviewService

  class InvalidURLError < StandardError
  end

  attr_reader :site_url

  def initialize(site_url)
    @site_url = smart_add_url_protocol(site_url)   # <-- Not working right now
    @thumbnail = LinkThumbnailer.generate(@site_url)

  rescue
    raise InvalidURLError
  end

  def image_url
    @thumbnail.images.first.src.to_s
  end

  def title
    @thumbnail.title
  end

  private

  def smart_add_url_protocol(url)        # <-- Not working right now
    if url.match(/\Ahttp:\/\//) || url.match(/\Ahttps:\/\//)
      url
    else
      url = "http://#{url}"
    end
  end

end