//
//  ContentView.swift
//  BleuProject
//
//  Created by Ana Livia de Oliveira Riegel Machado on 03/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .font(.largeTitle)
                .padding(5)
            Text("Hello, world!")
                .font(.largeTitle)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
