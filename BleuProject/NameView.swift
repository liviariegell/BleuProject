//
//  NameView.swift
//  BleuProject
//
//  Created by Ana Livia de Oliveira Riegel Machado on 10/11/22.
//

import SwiftUI

import SwiftUI


struct NameView: View {
    @State var username: String = ""
    var body: some View {
        VStack {
            Text("Qual é o seu nome?")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 200/255, green: 215/255, blue: 249/255))
            ZStack {
                RoundedRectangle(cornerRadius: 75)
                    .frame(width: 300, height: 100)
                    .foregroundColor(Color(red: 200/255, green: 215/255, blue: 249/255))
                HStack {
                    Image("planet")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                    TextField("Digite aqui...", text: $username)
                        .frame(width: 200, height: 100)
                }.font(.largeTitle)
            }
            
//            Text("Seu nome é \(username)")
        }
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}
