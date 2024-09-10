require 'spec_helper'
require 'api_tester/response'
require 'colorize'
require 'terminal-table'
require 'net/http'
require 'json'

RSpec.describe ApiTester::Response do
  let(:http_response) { instance_double(Net::HTTPResponse) }
  subject { described_class.new(http_response) }

  before do
    allow(http_response).to receive(:code).and_return('200')
    allow(http_response).to receive(:each_header).and_yield('Content-Type', 'application/json')
    allow(http_response).to receive(:[]).with('Content-Type').and_return('application/json')
    allow(http_response).to receive(:body).and_return('{"key": "value"}')
  end

  describe '#display' do
    it 'displays status, headers, and body' do
      expect(subject).to receive(:display_status)
      expect(subject).to receive(:display_headers)
      expect(subject).to receive(:display_body)
      subject.display
    end
  end

  describe '#display_status' do
    it 'displays status in green for 2xx responses' do
      expect { subject.send(:display_status) }.to output(/Status: 200/).to_stdout
    end

    it 'displays status in yellow for 3xx responses' do
      allow(http_response).to receive(:code).and_return('301')
      expect { subject.send(:display_status) }.to output(/Status: 301/).to_stdout
    end

    it 'displays status in red for 4xx and 5xx responses' do
      allow(http_response).to receive(:code).and_return('404')
      expect { subject.send(:display_status) }.to output(/Status: 404/).to_stdout
    end
  end

  describe '#display_headers' do
    it 'displays headers in a table format' do
      expect { subject.send(:display_headers) }.to output(/Headers:/).to_stdout
      expect { subject.send(:display_headers) }.to output(/Content-Type/).to_stdout
    end
  end

  describe '#display_body' do
    context 'when response is JSON' do
      it 'pretty prints JSON body' do
        expect { subject.send(:display_body) }.to output(/{\n  "key": "value"\n}/).to_stdout
      end
    end

    context 'when response is not JSON' do
      before do
        allow(http_response).to receive(:[]).with('Content-Type').and_return('text/plain')
        allow(http_response).to receive(:body).and_return('Plain text response')
      end

      it 'prints plain body' do
        expect { subject.send(:display_body) }.to output(/Plain text response/).to_stdout
      end
    end
  end
end
