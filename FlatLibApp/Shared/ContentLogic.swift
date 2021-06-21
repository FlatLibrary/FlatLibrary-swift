//
//  ContentLogic.swift
//  FlatLibApp
//
//  Created by Nail Sharipov on 21.06.2021.
//

import SwiftUI
import FlatLibClient

final class ContentLogic: ObservableObject {

    private let client: Client = {
        let client = Client()
        client.connect(host: "localhost", port: 50051)
        return client
    }()
    
    @Published var response: String = ""

    func onPress() {
        client.send(message: "I am Client") { [weak self] result in
            self?.response = result
        }
    }
}
