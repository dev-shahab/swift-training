//
//  ContentView.swift
//  ShahabCard
//
//  Created by Dev on 17/08/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    

    var body: some View {
        
        ZStack{
            Color(red: 0.18, green: 0.80, blue: 0.44)
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Image("shahab")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5) )
                
                Text("Shahab Sharif")
                    .foregroundColor(Color.white)
                    .font(Font.custom("DynaPuff-VariableFont_wdth,wght", size: 50))
                Text("iOS Developer")
                    .foregroundColor(Color.white)
                    .font(Font.custom("Montserrat-VariableFont_wght", size: 25))
                Divider()
                    .hidden()
                
                InfoView(text: "+923348639506", image: "phone.fill")
                InfoView(text: "engshahabsharif@gmail.com", image: "envelope.fill")
                
                    
                    
                
                
                /*
                Rectangle()
                    .foregroundColor(Color.white)
                    .frame(width: 400, height: 40)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                */
                
                /* Text("+923348639506")
                    .frame(width: 400, height: 40)
                    .foregroundColor(Color.black)
                    .background(in: Rectangle())
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                */
            }
            
        }
    }
}

   
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       
        ContentView().previewDevice(PreviewDevice(rawValue: "Iphone 13"))
    }
}

