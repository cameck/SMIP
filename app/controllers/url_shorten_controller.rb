class UrlShortenController < ApplicationController
  before_action :clean_params, only: [:create]

  def create
    @new_url = UrlShorten.new
    @new_url = @new_url.small_url(params[:url])
    # p @new_url = Rails.root.to_s + @new_url.small_url
    render 'create'
  end

  private
    def clean_params
      params.permit(:url)
    end
end
