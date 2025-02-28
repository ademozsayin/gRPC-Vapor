// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "VaporGRPC",
    platforms: [
       .macOS(.v15)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.110.1"),
        // 🗄 An ORM for SQL and NoSQL databases.
        .package(url: "https://github.com/vapor/fluent.git", from: "4.9.0"),
        // 🐘 Fluent driver for Postgres.
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.8.0"),
        // 🍃 An expressive, performant, and extensible templating language built for Swift.
        .package(url: "https://github.com/vapor/leaf.git", from: "4.3.0"),
        // 🔵 Non-blocking, event-driven networking for Swift. Used for custom executors
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.65.0"),
        
        // gRPC Swift Core
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.24.1"),
        // gRPC NIO Transport (for HTTP/2)
//        .package(url: "https://github.com/grpc/grpc-swift-nio-transport.git", from: "1.0.0"),
//        // gRPC Protocol Buffers support
//        .package(url: "https://github.com/grpc/grpc-swift-protobuf.git", from: "1.0.0"),

    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
                .product(name: "Leaf", package: "leaf"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "NIOCore", package: "swift-nio"),
                .product(name: "NIOPosix", package: "swift-nio"),
                
                .product(name: "GRPC", package: "grpc-swift"),
                
//                .product(name: "GRPCCore", package: "grpc-swift"),
//                .product(name: "GRPCNIOTransportHTTP2", package: "grpc-swift-nio-transport"),
//                .product(name: "GRPCProtobuf", package: "grpc-swift-protobuf"),
            ],
            swiftSettings: swiftSettings
//            plugins: [
//                .plugin(name: "GRPCProtobufGenerator", package: "grpc-swift-protobuf")
//            ]
        ),
        .testTarget(
            name: "AppTests",
            dependencies: [
                .target(name: "App"),
//                .product(name: "VaporTesting", package: "vapor"),
                .product(name: "XCTVapor", package: "vapor"),
            ],
            swiftSettings: swiftSettings
        )
    ],
    swiftLanguageModes: [.v5]
)

//var swiftSettings: [SwiftSetting] { [
//    .enableUpcomingFeature("DisableOutwardActorInference"),
//    .enableExperimentalFeature("StrictConcurrency"),
//] }

var swiftSettings: [SwiftSetting] { [
    .enableExperimentalFeature("StrictConcurrency"),
] }
