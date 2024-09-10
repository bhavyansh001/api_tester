module ApiTester
  class Helper
    def self.get_token_from_env
      ENV['API_AUTH_TOKEN']
    end

    def self.format_json(json_string)
      JSON.pretty_generate(JSON.parse(json_string))
    end
  end
end
