require "test_helper"
require "net_http_hacked"
require 'net/https'

class NetHttpHackedTest < Test::Unit::TestCase
  
  def test_net_http_hacked
    uri = URI("https://www.iana.org/")
    req = Net::HTTP::Get.new(uri.path)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'
    http.start

    # Response code
    res = http.begin_request_hacked(req)
    assert res.code == "200"

    # Headers
    headers = {}
    res.each_header { |k, v| headers[k] = v }

    assert headers.size > 0
    assert headers["content-type"] == "text/html; charset=UTF-8"
    assert !headers["date"].nil?

    # Body
    chunks = []
    res.read_body do |chunk|
      chunks << chunk
    end

    assert chunks.size > 0
    chunks.each do |chunk|
      assert chunk.is_a?(String)
    end

    http.end_request_hacked
  end
  
end
