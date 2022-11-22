//  FloresView.swift
//  BleuProject

import SwiftUI

struct FloresView: View {
    
    var messages: [String] = ["a", "b", "c"]
    @State var tappedFlor: Bool = false
    
    var body: some View {
        ZStack {
            Image("pflores")
            HStack {
                Button {
                    print()
                    tappedFlor = true
                    } label: {
                        Image("flor1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 60)
                    }.position(x: 60, y: 420)
                
                Button {
                    print()
                    } label: {
                        Image("flor2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 60)
                    }.position(x: 40, y: 440)
                
                Button {
                    print()
                    } label: {
                        Image("flor1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 60)
                    }.position(x: 80, y: 440)
                
                Button {
                    print()
                    } label: {
                        Image("flor2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 60)
                    }.position(x: 40, y: 420)
            }
            if tappedFlor {
                Text(messages.randomElement() ?? "z")
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            tappedFlor = false
                        }
                    }
            }
        }
    }
}

struct FloresView_Previews: PreviewProvider {
    static var previews: some View {
        FloresView()
    }
}
