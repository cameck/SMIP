class UrlShorten < ActiveRecord::Base
  validates :small_url, uniqueness: true

  def small_url(original_url)
    new_url = Rails.root
    new_url += SecureRandom.base64(4)
  end

end
