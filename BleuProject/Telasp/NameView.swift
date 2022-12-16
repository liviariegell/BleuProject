//  NameView.swift
//  BleuProject
//  Visual da tela - concluído. (18.11)

import SwiftUI

enum KeyValue: String {
    case salvando
}

let userDefaults = UserDefaults.standard

struct NameView: View {
    
    @AppStorage(KeyValue.salvando.rawValue) private var username: String = ""

    var body: some View {
//        NavigationStack {
            ZStack {
                Image("nome")
                    .frame(width: 2, height: 2)
                VStack {
                    Text("Qual é o seu nome?")
                        .font(.custom("IBMPlexMono-Regular", size: 30))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 200/255, green: 215/255, blue: 249/255))
                    ZStack {
                        RoundedRectangle(cornerRadius: 75)
                            .frame(width: 300, height: 80)
                            .foregroundColor(Color(red: 197/255, green: 214/255, blue: 255/255))
                        HStack {
                            Image("planet")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 48, height: 48)
                            TextField("Digite aqui...", text: $username)
                                .font(.custom("IBMPlexMono-Regular", size: 20))
                                .foregroundColor(Color(red: 1/255, green: 26/255, blue: 81/255))
                                .frame(width: 200, height: 100)
                        }.font(.title)
                    }
                    NavigationLink("OK") {
                        FloresView()
                            .navigationBarBackButtonHidden(true)
                    }
                    .disabled(username.isEmpty)
                    .foregroundColor(Color(red: 0/255, green: 17/255, blue: 77/255))
                    .font(.custom("IBMPlexMono-Regular", size: 20))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .tint(Color(red: 197/255, green: 214/255, blue: 255/255))
                }
            }
//        }
    }
    
struct NameView_Previews: PreviewProvider {
        static var previews: some View {
            NameView()
        }
    }
    
}
