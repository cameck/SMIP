class UrlShorten < ActiveRecord::Base
  # validates :small_url, uniqueness: true

  def url
    # new_url = Rails.root
    puts "============="
    new_url = SecureRandom.base64(9)
  end

  # def reroute(original_url)
  #   small_url
  # end

end
