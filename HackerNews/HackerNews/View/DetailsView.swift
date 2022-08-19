//
//  DetailsView.swift
//  HackerNews
//
//  Created by Dev on 19/08/2022.
//

import SwiftUI
import WebKit

struct DetailsView: View {
    
    let url:String?
    
    var body: some View {
        WebView(url: url)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(url: "https://Quran.com")
    }
}


