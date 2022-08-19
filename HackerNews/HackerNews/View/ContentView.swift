//
//  ContentView.swift
//  HackerNews
//
//  Created by Dev on 19/08/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @ObservedObject var newsManager = NewsManager()
    var body: some View {
        
        NavigationView{
            
            
            List(newsManager.posts, rowContent: { post in
                
                
                NavigationLink(destination: DetailsView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
                
                
                
            })

            .navigationBarTitle("Hacker News")
        }.onAppear {
                newsManager.fetchData()
            }
    }
        
    

    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}






