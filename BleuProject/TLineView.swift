//
//  TLineView.swift
//  BleuProject
//
//  Created by Ana Livia de Oliveira Riegel Machado on 24/11/22.
//

import SwiftUI

struct TLineView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.clear
                .overlay(alignment: .topTrailing){
                    Button {
                      dismiss()
                    } label: {
                        Image("x.circle.fill@100x")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 60)
                            .position(x: 340, y: 20)
                            .padding()
                    }
                }
            VStack(spacing: 40) {
                Text("Mémorias de Carolina Canopus.")
                    .foregroundColor(Color(red: 197/255, green: 214/255, blue: 255/255))
                    .font(.custom("IBMPlexMono-MediumItalic", size: 30))
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                VStack(alignment: .leading) {
                    Text("")
                        .font(.title)
                        .foregroundColor(Color(red: 197/255, green: 214/255, blue: 255/255))
                        .font(.custom("IBMPlexMono-MediumItalic", size: 30))
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            }
            .padding()
        } .background(Color(red: 184/255, green: 55/255, blue: 0/255))
    }
}


struct TLineView_Previews: PreviewProvider {
    static var previews: some View {
        TLineView()
    }
}
