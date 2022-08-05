//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    
    let stories = [
    
        Story(title: """
              Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide-brimmed hat and soulless eyes opens the passenger door for you and says: "Need a ride, boy?".
              """, choice1: "I'll hop in. Thanks for the help!", choice2: "Well, I don't have many options. Better ask him if he's a murderer", choice1Dest: 2, choice2Dest: 1),
        
        
        
        Story(title: ": He nods slowly, unphased by the question. ", choice1: "At least he's honest. I'll climb in. ", choice2: "Wait, I know how to change a tire. ", choice1Dest: 2, choice2Dest: 3),
        
        Story(title: """
              As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glove box. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.
              """, choice1: ": I love Elton John! Hand him the cassette tape. ", choice2: " It’s him or me. Take the knife and stab him.", choice1Dest: 5, choice2Dest: 4),
        
        Story(title: """
              What? Such a cop-out! Did you know accidental traffic accidents are the second leading cause of accidental death for most adult age groups?
              """, choice1: "", choice2: "", choice1Dest: -1, choice2Dest: -1),
        
        Story(title: """
              As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.
              """, choice1: "", choice2: "", choice1Dest: -1, choice2Dest: -1),
        Story(title: """
              You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier."
              """, choice1: "", choice2: "", choice1Dest: -1, choice2Dest: -1)
    
    
    ]
    
    var storyNumber:Int = 0
    
    func getStory() -> Story {
        return stories[storyNumber]
    }
    
    mutating func nextStory(choice usrChoice: String){
        if stories[storyNumber].choice1Destination < 0 || stories[storyNumber].choice2Destination < 0
        {
            return
        }
        
        if usrChoice == stories[storyNumber].choice1{
            storyNumber = stories[storyNumber].choice1Destination
        }
        else{
            storyNumber = stories[storyNumber].choice2Destination
        }
    }
    
    func isCompleted() -> Bool {
        if stories[storyNumber].choice1Destination < 0{
            return true
        }
        return false
    }
    
}