require 'spec_helper'
require 'api_tester/request'

RSpec.describe ApiTester::Request do
  subject { described_class.new }

  describe '#initialize' do
    it 'initializes with default values' do
      expect(subject.headers).to eq({})
      expect(subject.method).to eq('GET')
      expect(subject.body).to be_nil
      expect(subject.token).to be_nil
    end
  end

  describe '#set_headers' do
    it 'sets the headers' do
      headers = { 'Content-Type' => 'application/json' }
      subject.set_headers(headers)
      expect(subject.headers).to eq(headers)
    end
  end

  describe '#set_method' do
    it 'sets the method and upcases it' do
      subject.set_method('post')
      expect(subject.method).to eq('POST')
    end
  end

  describe '#set_body' do
    it 'sets the body' do
      body = { key: 'value' }
      subject.set_body(body)
      expect(subject.body).to eq(body)
    end
  end

  describe '#set_auth_token' do
    it 'sets the auth token' do
      token = 'test_token'
      subject.set_auth_token(token)
      expect(subject.token).to eq(token)
    end
  end
end
