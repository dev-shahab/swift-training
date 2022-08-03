//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    var storyBrain = StoryBrain()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let story = storyBrain.getStory()
        storyLabel.text = story.title
        choice1Button.setTitle(story.choice1, for: .normal)
        choice2Button.setTitle(story.choice2, for: .normal)


    }

    @IBAction func choiceMade(_ sender: UIButton) {
    
        //let story = storyBrain.getStory()
        
        storyBrain.nextStory(choice: sender.currentTitle!)
        
        updateUI()
    }
    
    func updateUI(){
        print("Status", storyBrain.isCompleted())
        if storyBrain.isCompleted(){
            choice1Button.isHidden = true
            choice2Button.isHidden = true
        }
        
        
        let story = storyBrain.getStory()
        storyLabel.text = story.title
        choice1Button.setTitle(story.choice1, for: .normal)
        choice2Button.setTitle(story.choice2, for: .normal)
    }
}

