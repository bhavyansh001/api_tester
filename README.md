
#  API Tester CLI Tool
A simple command-line tool to test REST APIs. This tool allows you to interactively input API details or provide them as command-line arguments for quick testing.

##  Features

- Supports HTTP methods (GET, POST, PUT, DELETE)
- Allows adding custom headers
- Supports JSON body for requests
- Bearer token authentication
- Interactive mode for beginners
- Command-line mode for advanced users
- Colored and formatted output for better readability

##  Installation

Add this line to your application's Gemfile:

```ruby
gem 'api_tester_cli'
```
Then execute:

```bash
bundle install
```
Or install it yourself with:

```bash
gem install api_tester_cli
```
Dependencies: json v2.7.1, colorize v1.1.0, teminal-table v3.0.2

##  Usage

1. Interactive Mode
Run the tool without any arguments, and it will prompt you for the necessary information interactively.
	```bash
	api-tester
	```
You will be asked to provide the following:
- URL
- HTTP Method (GET, POST, PUT, DELETE)
- Body (as JSON)
- Bearer Token (if needed)
- Custom Headers (optional)
	
2. Command-Line Mode
You can also provide arguments directly to make the process faster.
	```bash
	api-tester -u https://example.com/api/v1/login -m POST -H '{"Content-Type": "application/json"}' -b '{"email": "newuser@example.com", "password": "password123"}' -t  'your_bearer_token'
	```
Options:
- -u, --url : The API URL.
- -m, --method : The HTTP method (GET, POST, PUT, DELETE).
- -b, --body : The request body as JSON.
- -H, --headers : Custom headers as JSON.
- -t, --token : Bearer token for authorization.

3. Response
The response from the server is displayed with colored status codes, headers in table format, and pretty-printed JSON body.

## Logging

The tool provides colored logging to enhance visibility. Output includes details about the request, response status, and any errors encountered.

## Best Practices

Respect the API's terms of service and rate limits.
Ensure you have permission to test authenticated endpoints.
Use caution with sensitive information when testing.

## Contributing

Contributions are welcome! Report bugs and submit pull requests on GitHub at https://github.com/bhavyansh001/api_tester_cli. Please adhere to the Contributor Covenant code of conduct.

## License
api_tester_cli is released under the MIT License. See the LICENSE file for details.
