//
//  WebView.swift
//  HackerNews
//
//  Created by Dev on 19/08/2022.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{
    
    let url: String?
    
    func makeUIView(context: Context) -> UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        if let safeURL = url{
            if let urlObject = URL(string: safeURL){
                let request = URLRequest(url: urlObject)
                uiView.load(request)
            }
        }
    }
}
