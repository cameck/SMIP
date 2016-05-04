class UrlShorten < ActiveRecord::Base
  validates :small_url, uniqueness: true

  def url
    new_url = SecureRandom.base64(9)
  end
end
