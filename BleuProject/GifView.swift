//
//  GifView.swift
//  BleuProject
//
//  Created by Maria Vitória Diniz de Oliveira on 12/12/22.
//

import SwiftUI


struct gifzinho: View {
    var body: some View {
        VStack {
            TabView {
                GifWe()
                NameView()
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }.background().ignoresSafeArea()
    }
}


struct GifView_Previews: PreviewProvider {
    static var previews: some View {
        inicial()
    }
}
