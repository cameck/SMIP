class UrlShorten < ActiveRecord::Base
  validates :small_url, uniqueness: true

  def url
    new_url = SecureRandom.base64(2)
  end
end
