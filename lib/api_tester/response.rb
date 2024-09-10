require 'terminal-table'

module ApiTester
  class Response
    def initialize(response)
      @response = response
    end

    def display
      # Display status with color
      display_status

      # Display headers in a table format
      display_headers

      # Display body
      display_body
    end

    private

    def display_status
      # Use green for 2xx, yellow for 3xx, red for 4xx and 5xx
      status_code = @response.code.to_i
      color = case status_code
              when 200..299 then :green
              when 300..399 then :yellow
              else :red
              end

      puts "\nStatus: #{@response.code}".colorize(color)
    end

    def display_headers
      puts "\nHeaders:".light_blue

      # Using Terminal::Table to format headers
      headers_table = Terminal::Table.new do |t|
        t.headings = ['Header', 'Value']
        @response.each_header { |key, value| t.add_row([key, value]) }
      end

      puts headers_table
    end

    def display_body
      puts "\nBody:".light_blue

      if json_response?
        # Pretty-print JSON with color
        puts JSON.pretty_generate(JSON.parse(@response.body)).colorize(:light_green)
      else
        # Print plain body for non-JSON responses
        puts @response.body.colorize(:light_yellow)
      end
    end

    def json_response?
      @response['Content-Type'] && @response['Content-Type'].include?('application/json')
    end
  end
end
