class UrlShortenController < ApplicationController
  before_action :clean_params, only: [:create]

  def index
    @new_url = UrlShorten.new
    @user_last_url = UrlShorten.last
  end

  def show
    @url_found = UrlShorten.find_by(id: params[:id])

    if @url_found
      redirect_to @url_found.original_url
    else
      redirect_to root_path
    end

  end

  def create
    @new_url = UrlShorten.new(clean_params)
    @new_url.save
    redirect_to root_path
  end


  private
    def clean_params
      #require for table name permit that value from form (table column)
      params.require(:url_shorten).permit(:original_url, :small_url)
    end
end
