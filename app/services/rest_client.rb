require 'net/http'

class RestClient
  def initialize(url, content_type = 'application/json')
    @url = url
    @uri = URI(url)
    @content_type = { 'Content-Type' => content_type }
  end

  def get
    http = Net::HTTP.new(@uri.host, @uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(@url, @content_type)

    http.request(request)
  end
end
