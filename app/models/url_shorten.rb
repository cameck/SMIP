class UrlShorten < ActiveRecord::Base
  validates :small_url, uniqueness: true

  def format_url
    self.original_url = if self.original_url.include?('http')
                          self.original_url
                        else
                          self.original_url.prepend('http://')
                        end
  end

  def url_exist?
    url = URI.parse(self.original_url)
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = (url.scheme == 'https')
    path = (url.path if url.path.present?) || '/'
    res = req.request_head(path)
    res.code != '404'
  rescue SocketError
    false
  end
end
