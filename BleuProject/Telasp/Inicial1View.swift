//  Inicial1View.swift
//  BleuProject

import SwiftUI



struct inicial: View {
    
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                InicialView()
                    .tag(0)
                NameView()
                    .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .never))
        }.background().ignoresSafeArea()
    }
}


struct Inicial1View_Previews: PreviewProvider {
    static var previews: some View {
        inicial()
    }
}
