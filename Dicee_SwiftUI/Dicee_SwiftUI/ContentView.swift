//
//  ContentView.swift
//  Dicee_SwiftUI
//
//  Created by Dev on 18/08/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @State var leftDiceNumber:Int = 1
    @State var rightDiceNumber:Int = 1
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("diceeLogo")
                Spacer()
                HStack{
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.all)
                
                Spacer()
                Spacer()
                
                Button {
                    print("Hello")
                    leftDiceNumber = Int.random(in: 1 ... 6)
                    rightDiceNumber = Int.random(in: 1 ... 6)
                } label: {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding()
                }
                .background(Color.red)
                

                
            }
            .padding()
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

}

struct DiceView: View {
    let n:Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}
