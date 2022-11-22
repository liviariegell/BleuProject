//  Inicial1View.swift
//  BleuProject

import SwiftUI

struct Inicial1View: View {
    var body: some View {
        ZStack{
            Image ("inicial1")
            RoundedRectangle(cornerRadius: 60)
                .frame(width: 330, height: 540)
                .foregroundColor(Color(red: 197/255, green: 214/255, blue: 255/255))
        }
    }
}

struct inicial: View {
    var body: some View {
        VStack {
            TabView {
                InicialView()
                Inicial1View()
                NameView()
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }.background().ignoresSafeArea()
    }
}


struct Inicial1View_Previews: PreviewProvider {
    static var previews: some View {
        inicial()
    }
}
