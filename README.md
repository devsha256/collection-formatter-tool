# API Collection Converter

This REST API converts API collection files between different formats, currently supporting REST and SOAP APIs. It accepts request bodies in `application/json` or `application/xml` formats and converts them to a specified output format, also in `application/json` or `application/xml`. The converted data is then written to files.  Future development will integrate with AWS for file export and downloadable links.

## Description

This project aims to simplify the process of migrating API collections between different tools.  It eliminates the manual effort of converting files by providing a REST API for automated conversion.  Currently, it supports conversion between Postman, Insomnia, SOAP, and Advanced REST Connector formats.

## Table of Contents

- [API Collection Converter](#api-collection-converter)
  - [Description](#description)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Supported Formats](#supported-formats)
  - [Query Parameters](#query-parameters)
  - [Request Body](#request-body)
  - [Future Enhancements](#future-enhancements)
  - [Contributing](#contributing)
  - [License](#license)
  - [Contact](#contact)

## Installation

This project is currently being developed using MuleSoft technologies.  Specific installation instructions will be provided upon release.  (e.g., instructions for setting up the MuleSoft environment and deploying the application).  The final distribution may include a packaged deployable or deployment instructions for a runtime environment.

## Usage

The tool is accessed via a REST API.  The conversion is triggered by making a POST request to the API endpoint with the required query parameters and request body.

```bash
# Example using curl:
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
        "inputData": {
          "/* Your API Collection Data Here */"
        }
      }' \
  "http://your-api-endpoint/convert?from=postman&to=insomnia&outputPath=/path/to/output.json"

# Example using Postman:
# Method: POST
# URL: http://your-api-endpoint/convert
# Headers: Content-Type: application/json
# Body:
# {
#   "inputData": {
#     "/* Your API Collection Data Here */"
#   }
# }
# Query Parameters:
# from: postman
# to: insomnia
# outputPath: /path/to/output.json

```

## Supported Formats

The tool currently supports the following API collection formats:

*   Postman
*   Insomnia
*   SOAP
*   Advanced REST Connector

## Query Parameters

The following query parameters are required for the conversion:

*   `from`: The source format of the API collection.  Allowed values: `postman`, `insomnia`, `soap`, `advanced-rest-connector`.  Type: `string`.
*   `to`: The target format for the API collection. Allowed values: `postman`, `insomnia`, `soap`, `advanced-rest-connector`. Type: `string`.
*   `outputPath`: The file path to the output API collection file. Type: `string` with file path pattern validation.

## Request Body

The request body should be in either `application/json` or `application/xml` format and contain the API collection data to be converted. The key for the API collection data should be `"inputData"`.

```json
{
  "inputData": {
    /* Your API Collection Data Here */
  }
}
```

or

```xml
<data>
  <inputData>
    </inputData>
</data>
```

## Future Enhancements

*   **AWS Integration:**  The project will be integrated with AWS services to facilitate file export and provide downloadable links for converted files.
*   **CLI Tool (Optional):**  A command-line interface using Node.js packages may be developed in the future for easier local use.
*   **Expanded Format Support:**  Support for additional API collection formats will be considered.
*   **Error Handling:**  Improved error handling and reporting mechanisms.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes.
4.  Submit a pull request.

## License

(Specify the license under which your project is distributed.  Common licenses include MIT, GPL, Apache 2.0.  For example:)

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

Bio: [my blog](https://devsha256.github.io)
GitHub: @devsha256