//  InicialView.swift
//  BleuProject

import SwiftUI

struct InicialView: View {
    var body: some View {
        GifWebView(gifName: "Gif")
            .ignoresSafeArea()
    }
}

struct InicialView_Previews: PreviewProvider {
    static var previews: some View {
        InicialView()
    }
}
