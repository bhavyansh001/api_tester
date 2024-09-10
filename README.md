
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
	git clone https://github.com/yourusername/api-tester.git
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
	URL
	HTTP Method (GET, POST, PUT, DELETE)
	Body (as JSON)
	Bearer Token (if needed)
	Custom Headers (optional)
	
2. Command-Line Mode
You can also provide arguments directly to make the process faster.
	```bash

	bin/api-tester  -u  https://your-api.com/login  -m  POST  -H  '{"Content-Type": "application/json"}'  -b  '{"email": "user@example.com", "password": "password123"}'  -t  'your_bearer_token'

	```
	Options:
	-u, --url : The API URL.
	-m, --method : The HTTP method (GET, POST, PUT, DELETE).
	-b, --body : The request body as JSON.
	-H, --headers : Custom headers as JSON.
	-t, --token : Bearer token for authorization.

3. Response
The response from the server is displayed with colored status codes, headers in table format, and pretty-printed JSON body.