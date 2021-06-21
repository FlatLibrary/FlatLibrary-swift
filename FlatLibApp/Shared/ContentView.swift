//
//  ContentView.swift
//  Shared
//
//  Created by Nail Sharipov on 21.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var logic = ContentLogic()
    
    var body: some View {
        VStack {
            Text("Hello, world! \(logic.response)").padding()
            Button(action: logic.onPress) {
                Text("PressMe")
            }
        }.frame(minWidth: 250, maxWidth: .greatestFiniteMagnitude, minHeight: 200, maxHeight: .greatestFiniteMagnitude)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
