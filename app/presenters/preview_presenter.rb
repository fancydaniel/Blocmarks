class PreviewPresenter
  attr_accessor :site_url, :image_url

  def initialize(site_url)
    @present = !!site_url
    @site_url = site_url

    # Breaks when site_url is nil
    if site_url
      @image_url = PreviewService.new(site_url).image_url
    else
      @image_url = nil
    end
  end

  def present?
    @present
  end
end