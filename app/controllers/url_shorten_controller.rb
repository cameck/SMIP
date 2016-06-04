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
      # @url_found = validate_url_format(@url_found.original_url)
      redirect_to @url_found.original_url
    else
      redirect_to root_path
    end

  end

  def create
    @new_url = UrlShorten.new(clean_params)
    @new_url.small_url = @new_url.url

    # Ensure User gave us a valid http: if not add it
    @new_url.original_url = validate_url_format(@new_url.original_url)

    if url_exist?(@new_url.original_url)
      @new_url.save
      if @new_url.persisted?
        @small_url = @new_url.small_url
        @original_url = @new_url.original_url
      end
    else
      @error_message = "That's not a valid URL, try again :D."
    end
    # Load Response with Ajax on index page
  end


  def url_exist?(url_string)
    url = URI.parse(url_string)
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = (url.scheme == 'https')
    path = url.path if url.path.present?
    res = req.request_head(path || '/')
    res.code != "404" # false if returns 404 - not found
  rescue
    false # false if can't find the server
  end

  def validate_url_format(user_url)
    if user_url.include? "http"
      user_url
    else
      user_url.prepend("http://")
    end
  end

  private
    def clean_params
      #require for table name permit that value from form (table column)
      params.require(:url_shorten).permit(:original_url, :small_url)
    end
end
