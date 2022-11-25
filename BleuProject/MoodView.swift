//  MoodView.swift
//  BleuProject
//  Visual da tela - concluído. (18.11)

import SwiftUI

struct MoodView: View {
    var body: some View {
        ZStack {
            Image("mood")
            VStack {
                Text("Como você está se sentindo hoje?")
                    .font(.custom("IBMPlexMono-Regular", size: 30))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 200/255, green: 215/255, blue: 249/255))
                HStack {
                    Image("bleu_triste")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 250)
                    

                        Image("bleu_raivoso")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 250)
                        
                        Image("bleu_sreação")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 250)
                    
                        Image("bleu_feliz")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 250)
                
                }
                ZStack {
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 40)
                            .frame(width: 280, height: 50)
                            .foregroundColor(Color(red: 200/255, green: 215/255, blue: 249/255))
                    }
                    Text("CONCLUÍDO")
                        .font(.custom("IBMPlexMono-Regular", size: 25))
                        .foregroundColor(Color(red: 1/255, green: 26/255, blue: 81/255))
                }
            }
        }
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
    }
}
