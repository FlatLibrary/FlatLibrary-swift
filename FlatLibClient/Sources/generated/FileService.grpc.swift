//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: FileService.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf


/// The greeting service definition.
///
/// Usage: instantiate `Service_GreeterClient`, then call methods of this protocol to make API calls.
public protocol Service_GreeterClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Service_GreeterClientInterceptorFactoryProtocol? { get }

  func sayHello(
    _ request: Service_HelloRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Service_HelloRequest, Service_HelloReply>
}

extension Service_GreeterClientProtocol {
  public var serviceName: String {
    return "service.Greeter"
  }

  /// Sends a greeting.
  ///
  /// - Parameters:
  ///   - request: Request to send to SayHello.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func sayHello(
    _ request: Service_HelloRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Service_HelloRequest, Service_HelloReply> {
    return self.makeUnaryCall(
      path: "/service.Greeter/SayHello",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSayHelloInterceptors() ?? []
    )
  }
}

public protocol Service_GreeterClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'sayHello'.
  func makeSayHelloInterceptors() -> [ClientInterceptor<Service_HelloRequest, Service_HelloReply>]
}

public final class Service_GreeterClient: Service_GreeterClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Service_GreeterClientInterceptorFactoryProtocol?

  /// Creates a client for the service.Greeter service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Service_GreeterClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}
