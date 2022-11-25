//  Flores1View.swift
//  BleuProject
//  Visual da tela - concluído. (19.11)

import SwiftUI

struct Flores1View: View {
    @State private var text = ""
    var body: some View {
        ZStack {
            Image("plantando")
            
            RoundedRectangle(cornerRadius: 70)
                .frame(width: 330, height: 630)
                .foregroundColor(Color(red: 197/255, green: 214/255, blue: 255/255))
            
            TextEditor(text: $text)
                .scrollContentBackground(.hidden)
                .foregroundColor(Color(red: 0/255, green: 17/255, blue: 77/255))
                .font(.custom("IBMPlexMono-Regular", size: 15))
                .frame(width: 300, height: 480)
            
            
            VStack {
                Image(systemName: "chevron.backward.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 55)
                    .position(x: 75, y: 90)
                    .foregroundColor(Color(red: 200/255, green: 215/255, blue: 249/255))
            }
            
            ZStack{
                Button {
                    print("Upload button was tapped")
                } label: {
                    Image(systemName: "photo.on.rectangle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 30)
                        .foregroundColor(Color(red: 0/255, green: 17/255, blue: 77/255))
                }
            }.position(x: 310, y: 720)
            
            
            ZStack {
                Button {
                    
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 160, height: 30)
                        .foregroundColor(Color(red: 197/255, green: 214/255, blue: 255/255))
                }
                Text("CONCLUÍDO")
                    .font(.custom("IBMPlexMono-Regular", size: 16))
                    .foregroundColor(Color(red: 1/255, green: 26/255, blue: 81/255))
            } .position(x:205, y: 800)
            
        }
        
    }
    
}

struct Flores1View_Previews: PreviewProvider {
    static var previews: some View {
        Flores1View()
    }
}
