require 'spec_helper'
require 'api_tester/client'
require 'api_tester/response'

RSpec.describe ApiTester::Client do
  let(:url) { 'https://api.example.com/endpoint' }
  let(:headers) { { 'Content-Type' => 'application/json' } }
  let(:method) { 'GET' }
  let(:body) { nil }
  let(:token) { nil }

  subject { described_class.new(url, headers, method, body, token) }

  describe '#send_request' do
    let(:http_double) { instance_double(Net::HTTP) }
    let(:response_double) { instance_double(Net::HTTPResponse) }

    before do
      allow(Net::HTTP).to receive(:new).and_return(http_double)
      allow(http_double).to receive(:use_ssl=)
      allow(http_double).to receive(:request).and_return(response_double)
    end

    it 'sends a GET request' do
      expect(Net::HTTP::Get).to receive(:new).with(URI(url), headers).and_call_original
      subject.send_request
    end

    context 'when method is POST' do
      let(:method) { 'POST' }
      let(:body) { { key: 'value' } }

      it 'sends a POST request with body' do
        expect(Net::HTTP::Post).to receive(:new).with(URI(url), headers).and_call_original
        subject.send_request
      end
    end

    context 'when method is PUT' do
      let(:method) { 'PUT' }
      let(:body) { { key: 'value' } }

      it 'sends a PUT request with body' do
        expect(Net::HTTP::Put).to receive(:new).with(URI(url), headers).and_call_original
        subject.send_request
      end
    end

    context 'when method is DELETE' do
      let(:method) { 'DELETE' }

      it 'sends a DELETE request' do
        expect(Net::HTTP::Delete).to receive(:new).with(URI(url), headers).and_call_original
        subject.send_request
      end
    end

    it 'returns an ApiTester::Response object' do
      expect(subject.send_request).to be_an_instance_of(ApiTester::Response)
    end
  end
end
