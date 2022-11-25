//  FloresView.swift
//  BleuProject

import SwiftUI

struct FloresView: View {
    var messages: [String] = ["Faça sempre o seu melhor, pequeno astro. É só o que importa.", "Ei, não desista! Você é incrível!", "Nunca duvide da sua força, ela existe e é maior do que você imagina.", "É corajoso se permitir sentir medo.", "Há situações que a melhor coisa a fazer é se perdoar.", "Somos imperfeitos, como todos os astros, mas ainda sim, perfeitos da nossa maneira.", "Não se preocupe, toda tempestade passará em algum momento e tudo ficará bem.", "Vamos respirar fundo!"]
    @State var tappedFlor: Bool = false
    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            Image("home1")
            HStack {
                Text("Olá!")
                    .padding()
                    .foregroundColor(Color(red: 197/255, green: 214/255, blue: 255/255))
                    .font(.custom("IBMPlexMono-MediumItalic", size: 30))
                    .multilineTextAlignment(.center)
                    .position(x: 210, y: 110)
                
            }
            
            HStack {
                Button {
                    print()
                } label: {
                    Image("bleu_feliz")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 500, height: 250)
                }.position(x: 210, y: 300)
            }
            
            HStack {
                Button {
                    tappedFlor = true
                } label: {
                    Image("flor1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 60)
                }.position(x: 60, y: 420)
                
                Button {
                    tappedFlor = true
                } label: {
                    Image("flor2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 60)
                }.position(x: 20, y: 440)
                
                Button {
                    tappedFlor = true
                } label: {
                    Image("flor1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 60)
                }.position(x: 90, y: 440)
                
                Button {
                    tappedFlor = true
                } label: {
                    Image("flor2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 60)
                }.position(x: 40, y: 420)
            }
            
            if tappedFlor {
                
                ZStack{
                    
                    Text(messages.randomElement() ?? "Houve um problema!")
                        .padding()
                        //.background(Color(red: 197/255, green: 214/255, blue: 255/255))
                        //.foregroundColor(Color(red: 0/255, green: 17/255, blue: 77/255))
                        .foregroundColor(Color(red: 197/255, green: 214/255, blue: 255/255))
                        .font(.custom("IBMPlexMono-MediumItalic", size: 24))
                        .multilineTextAlignment(.center)
                        //.clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        //.frame(width: 360, height: 140)
                        .position(x: 205, y: 580)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                tappedFlor = false
                            }
                        }
                }
                
            }
            
            VStack {
                Button("RELEMBRAR       ") {
                        
                }
                .foregroundColor(Color(red: 0/255, green: 17/255, blue: 77/255))
                .font(.custom("IBMPlexMono-Regular", size: 20))
                .position(x: 205, y: 800)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .tint(Color(red: 197/255, green: 214/255, blue: 255/255))
                }
            
                Button("PLANTAR FLORES  ") {
                    showSheet.toggle()
                }
                .foregroundColor(Color(red: 0/255, green: 17/255, blue: 77/255))
                .font(.custom("IBMPlexMono-Regular", size: 20))
                .position(x: 205, y: 750)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .tint(Color(red: 197/255, green: 214/255, blue: 255/255))
                Spacer()
            }
        
            .sheet(isPresented: $showSheet){
                TLineView()
                    .presentationDetents([.fraction(0.35),.large])
                
            }
        }
    }
    
    
    
    struct FloresView_Previews: PreviewProvider {
        static var previews: some View {
            FloresView()
        }
    }
