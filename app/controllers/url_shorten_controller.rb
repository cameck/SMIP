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
      if @url_found.original_url.include? "http"
        redirect_to @url_found.original_url
      else
        @url_found = @url_found.original_url
        @url_found.prepend("http://")
        redirect_to @url_found
      end
    else
      redirect_to root_path
    end

  end

  def create
    @new_url = UrlShorten.new(clean_params)
    @new_url.small_url = @new_url.url
    @new_url.save

    if @new_url.persisted?
      @small_url = @new_url.small_url
      @original_url = @new_url.original_url
    else
      @error_message = "Sorry something went wrong, please try again."
    end
    # Load Response with Ajax on index page
  end


  private
    def clean_params
      #require for table name permit that value from form (table column)
      params.require(:url_shorten).permit(:original_url, :small_url)
    end
end
