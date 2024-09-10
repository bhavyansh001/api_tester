require 'net/http'
require 'uri'
require 'json'

module ApiTester
  class Client
    def initialize(url, headers = {}, method = 'GET', body = nil, token = nil)
      @uri = URI.parse(url)
      @headers = headers
      @method = method
      @body = body
      @token = token
    end

    def send_request
      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = @uri.scheme == 'https' # Enable SSL for HTTPS

      request = build_request
      add_auth_token(request) if @token

      response = http.request(request)
      ApiTester::Response.new(response)
    end

    private

    def build_request
      case @method.upcase
      when 'POST'
        req = Net::HTTP::Post.new(@uri, @headers)
        req.body = @body.to_json if @body # Convert body to JSON string
        req
      when 'PUT'
        req = Net::HTTP::Put.new(@uri, @headers)
        req.body = @body.to_json if @body
        req
      when 'DELETE'
        Net::HTTP::Delete.new(@uri, @headers)
      else
        Net::HTTP::Get.new(@uri, @headers)
      end
    end

    def add_auth_token(request)
      request['Authorization'] = "Bearer #{@token}"
    end
  end
end
