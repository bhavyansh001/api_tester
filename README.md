
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

1. Clone the repository:
	```bash
	git clone https://github.com/bhavyansh001/api-tester.git
	```
2. Install dependencies:
	```bash
	bundle install
	```
3. Run the CLI tool:
	```bash
	cd api-tester
	chmod +x bin/api-tester
	```
##  Usage

1. Interactive Mode
Run the tool without any arguments, and it will prompt you for the necessary information interactively.
	```bash
	bin/api-tester
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
	bin/api-tester -u https://your-api.com/login -m POST -H '{"Content-Type": "application/json"}' -b '{"email": "user@example.com", "password": "password123"}' -t  'your_bearer_token'
	```
Options:
- -u, --url : The API URL.
- -m, --method : The HTTP method (GET, POST, PUT, DELETE).
- -b, --body : The request body as JSON.
- -H, --headers : Custom headers as JSON.
- -t, --token : Bearer token for authorization.

3. Response
The response from the server is displayed with colored status codes, headers in table format, and pretty-printed JSON body.

## Configuration

api_tester_cli uses sensible defaults but can be configured according to your needs:

- max_pages: Controls the maximum number of requests to handle in interactive mode (default: unlimited).
- session_cookie: For authenticated access if required.

## Logging

The tool provides colored logging to enhance visibility. Output includes details about the request, response status, and any errors encountered.

## Best Practices

Respect the API's terms of service and rate limits.
Ensure you have permission to test authenticated endpoints.
Use caution with sensitive information when testing.

## Contributing

Contributions are welcome! Report bugs and submit pull requests on GitHub at https://github.com/yourusername/api_tester_cli. Please adhere to the Contributor Covenant code of conduct.

## License
api_tester_cli is released under the MIT License. See the LICENSE file for details.
