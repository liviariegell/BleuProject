//
//  MoodView.swift
//  BleuProject
//
//  Created by Amanda do Nascimento Prudente Barros on 11/11/22.
//

import SwiftUI

struct MoodView: View {
    var body: some View {
        ZStack {
            Image("mood")
            VStack {
                Text("Como você está se sentindo hoje?")
                    .font(.largeTitle)
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
                        print("CONCLUÍDO")
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 40)
                            .frame(width: 280, height: 55)
                            .foregroundColor(Color(red: 200/255, green: 215/255, blue: 249/255))
                    }
                    Text("CONCLUÍDO")
                        .font(.title2)
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