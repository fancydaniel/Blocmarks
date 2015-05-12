class PreviewPresenter
  attr_accessor :site_url

  def initialize(site_url)
    @site_url = site_url
  end

  def image_url
    PreviewService.new(site_url).image_url
  end
end