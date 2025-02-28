//
//  GRPCServer..swift
//  VaporGRPC
//
//  Created by Adem Özsayın on 28.02.2025.
//


import Vapor
import GRPC
import NIOCore
import NIOPosix

final class GreeterService: Greeter_GreeterProvider {
    let interceptors: Greeter_GreeterServerInterceptorFactoryProtocol? = nil

    func sayHello(request: Greeter_HelloRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Greeter_HelloResponse> {
        let response = Greeter_HelloResponse.with {
            $0.message = "Hello, \(request.name)!"
        }
        return context.eventLoop.makeSucceededFuture(response)
    }
}

func configureGRPC(app: Application) throws {
    let group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
    
    let server = try GRPC.Server.insecure(group: group)
        .withServiceProviders([GreeterService()])
        .bind(host: "0.0.0.0", port: 50051)
        .wait()

    app.logger.info("🚀 gRPC Server is running on port 50051")

    app.lifecycle.use(ApplicationLifecycle(server: server))
}

struct ApplicationLifecycle: LifecycleHandler {
    let server: GRPC.Server

    func shutdown(_ application: Application) {
        server.close().whenComplete { result in
            switch result {
            case .success:
                application.logger.info("✅ gRPC Server closed successfully.")
            case .failure(let error):
                application.logger.error("❌ Error shutting down gRPC Server: \(error)")
            }
        }
    }
}
