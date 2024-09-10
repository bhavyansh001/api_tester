require 'spec_helper'
require 'api_tester/helper'
require 'json'

RSpec.describe ApiTester::Helper do
  describe '.get_token_from_env' do
    it 'returns the value of API_AUTH_TOKEN environment variable' do
      ENV['API_AUTH_TOKEN'] = 'test_token'
      expect(described_class.get_token_from_env).to eq('test_token')
      ENV.delete('API_AUTH_TOKEN')
    end

    it 'returns nil if API_AUTH_TOKEN is not set' do
      ENV.delete('API_AUTH_TOKEN')
      expect(described_class.get_token_from_env).to be_nil
    end
  end

  describe '.format_json' do
    it 'formats a JSON string' do
      input = '{"key":"value","nested":{"array":[1,2,3]}}'
      expected_output = "{\n  \"key\": \"value\",\n  \"nested\": {\n    \"array\": [\n      1,\n      2,\n      3\n    ]\n  }\n}"
      expect(described_class.format_json(input)).to eq(expected_output)
    end

    it 'raises an error for invalid JSON' do
      expect { described_class.format_json('invalid json') }.to raise_error(JSON::ParserError)
    end
  end
end
