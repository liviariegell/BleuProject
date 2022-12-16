//  GifWebView.swift
//  BleuProject

import SwiftUI
import WebKit

class FullScreenWebView: WKWebView {
    override var safeAreaInsets: UIEdgeInsets { .zero }
}

struct GifWebView: UIViewRepresentable {
    
    let gifName: String
    
    func makeUIView(context: Context) -> WKWebView  {
        return FullScreenWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let data = gifData(), let url = gifURL() {
            uiView.load(data, mimeType: "image/gif", characterEncodingName: "UTF-8", baseURL: url)
            uiView.isUserInteractionEnabled = false
            uiView.pageZoom = 0.5
        }
    }
    
    private func gifURL() -> URL? {
        return Bundle.main.url(forResource: gifName, withExtension: "gif")
    }
    
    private func gifData() -> Data? {
        if let url = gifURL() {
            return try? Data(contentsOf: url)
        } else {
            return nil
        }
    }
    
}
