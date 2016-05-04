class UrlShorten < ActiveRecord::Base
  validates :small_url, uniqueness: true

  def url
    new_url = SecureRandom.hex(2)
  end
end
