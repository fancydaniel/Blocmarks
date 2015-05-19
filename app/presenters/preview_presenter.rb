class PreviewPresenter
  attr_accessor :site_url, :image_url

  def initialize(site_url)
    @present = !!site_url
    @site_url = site_url
    @image_url = PreviewService.new(site_url).image_url
  end

  def present?
    @present
  end
end