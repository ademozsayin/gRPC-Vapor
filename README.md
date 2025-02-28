
# gRPC Vapor Server

This project is a **gRPC server** built using **Vapor** and **gRPC-Swift**.

## Features
- Implements a gRPC server using Vapor
- Uses Swift Package Manager (SPM) for dependency management
- Supports Protocol Buffers (protobuf) for defining RPC services

## Installation

### Prerequisites
- Xcode 15 or later
- Swift 5.9 or later
- Homebrew (for installing dependencies)

### Install Dependencies
```sh
brew install protobuf grpc-swift
```

### Clone the Repository
```sh
git clone https://github.com/ademozsayin/gRPC-Vapor.git
cd gRPC-Vapor
```

### Build the Project
```sh
swift build
```

### Run the Server
```sh
swift run
```

The server will start on `localhost:50051`.

## Testing with Postman
1. Open **Postman** and select **gRPC request**.
2. Enter `localhost:50051` as the server address.
3. Import the `Proto/Greeter.proto` file.
4. Send a request to `Greeter/SayHello` with a JSON payload:
   ```json
   {
     "name": "Your Name"
   }
   ```
5. You should receive a response:
   ```json
   {
     "message": "Hello, Your Name!"
   }
   ```

## Project Structure
```
├── Proto              # Protocol Buffers definitions
├── Public             # Static public files
├── Resources          # Additional resources
├── Sources            # Main source code
│   ├── App            # Application logic
│   ├── Generated      # gRPC generated files
│   ├── entrypoint.swift # App entry point
├── Tests              # Unit tests
├── Package.swift      # Swift Package Manager file
├── Dockerfile         # Docker configuration
├── .gitignore         # Git ignore rules
├── README.md          # Project documentation
```

## Contributing
Feel free to submit a pull request or open an issue for improvements!

## License
This project is licensed under the MIT License.

