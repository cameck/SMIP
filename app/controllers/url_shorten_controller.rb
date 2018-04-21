class UrlShortenController < ApplicationController
  before_action :clean_params, only: [:create]

  def index
    @new_url = UrlShorten.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @url_found = UrlShorten.find_by(small_url: params[:small_url])

    if @url_found
      redirect_to @url_found.original_url
    else
      redirect_to root_path
    end
  end

  def create
    @new_url = UrlShorten.new(clean_params)
    @new_url.small_url = SecureRandom.hex(2)
    @new_url.format_url

    if @new_url.url_exist? && @new_url.save && @new_url.persisted?
      @small_url = root_url(only_path: false) + @new_url.small_url
      @original_url = @new_url.original_url
    else
      @error_message = "That's not a valid URL, try again :D."
    end
  end

  private

  def clean_params
    params.require(:url_shorten).permit(:original_url, :small_url)
  end
end
