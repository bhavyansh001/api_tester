module ApiTester
  class Request
    attr_reader :headers, :method, :body, :token

    def initialize
      @headers = {}
      @method = 'GET'
      @body = nil
      @token = nil
    end

    def set_headers(headers)
      @headers = headers
    end

    def set_method(method)
      @method = method.upcase
    end

    def set_body(body)
      @body = body
    end

    def set_auth_token(token)
      @token = token
    end
  end
end
