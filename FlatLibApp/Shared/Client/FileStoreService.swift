//
//  FileStoreService.swift
//  FlatLibApp (iOS)
//
//  Created by Nail Sharipov on 21.06.2021.
//

import FlatLibClient
import GRPC
import Logging
import NIO

final class Client {

    // Setup an `EventLoopGroup` for the connection to run on.
    //
    // See: https://github.com/apple/swift-nio#eventloops-and-eventloopgroups
    private let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    private let port: Int = 50051
    private var service: Service_GreeterClient?
    private var channel: ClientConnection?

    
    func connect(host: String = "localhost", port: Int) {
        let channel = ClientConnection.insecure(group: group).connect(host: "localhost", port: self.port)
        self.service = Service_GreeterClient(channel: channel)
    }
    
    func disconnect() {
        do {
            try channel?.close().wait()
            try group.syncShutdownGracefully()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func send(message: String, callback: (String) -> ()) {
        guard let service = service else { return }
        let request = Service_HelloRequest.with {
          $0.name = message
        }
        
        // Make the RPC call to the server.
        let handler = service.sayHello(request)
        do {
            let response = try handler.response.wait()
            callback(response.message)
            debugPrint("Greeter received: \(response.message)")
        } catch {
            callback(error.localizedDescription)
            debugPrint("Greeter failed: \(error)")
        }
    }
}
