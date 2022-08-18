//
//  InfoView.swift
//  ShahabCard
//
//  Created by Dev on 18/08/2022.
//

import SwiftUI

struct InfoView: View {
    
    let text:String //= "+923348639506"
    let image:String //= "phone.fill"
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
        
            .overlay(HStack {
                Image(systemName: image)
                    .foregroundColor(.green)
                Text(text)
                
            }).padding(.all)
    }
    
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "+923348639506", image: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
