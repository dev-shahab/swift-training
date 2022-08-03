//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer:Timer?
    
    @IBOutlet weak var sccoreView: UILabel!
    
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!

    @IBOutlet weak var optOne: UIButton!
    
    @IBOutlet weak var optTwo: UIButton!
    
    @IBOutlet weak var optThree: UIButton!
    
    
    var quizBrain:QuizBrain = QuizBrain()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = quizBrain.getQuestion() //questions[0].question
        updateOptionUI()
        progressView.progress = 0
        sccoreView.text = "Sccore: " + String(quizBrain.getScore())
    }

  
    
    @IBAction func answerButton(_ sender: UIButton) {
        
        if quizBrain.areAllaQuestionsCovered(){
            
            optOne.isHidden = true
            optTwo.isHidden = true
            optThree.isHidden = true
            
            if quizBrain.getScore() >= 5 {
                questionText.text = quizBrain.winningText()
            }
            else{
                questionText.text = quizBrain.lostText()
            }
            
            return
        }
        
        if quizBrain.checkAnswer(sender.currentTitle!){
            sender.backgroundColor = UIColor.green
            
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        optOne.isEnabled = false
        optTwo.isEnabled = false
        optThree.isEnabled = false
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block:
                                {_ in
            self.updateQuestionUI()
        
        })
        //timer.invalidate() Yeh yahan Likhna galat hai bcoz
        //Agr ham isko chalaa deyn to timer to background me chall raha hai
        //but jessey hi compiler next line per jaayga woh timer ko background se invalidate karrdeyga or phr color change ni hoga
        

    }
    
    
    func updateQuestionUI(){
        quizBrain.nextQuestion()
        questionText.text = quizBrain.getQuestion()
        progressView.progress += quizBrain.getProgress()
        sccoreView.text = "Sccore: " +  String(quizBrain.getScore())
        updateOptionUI()
        clearButtonsColor()
        timer?.invalidate()
        optOne.isEnabled = true
        optTwo.isEnabled = true
        optThree.isEnabled = true
        
    }
    
    func clearButtonsColor(){
        optOne.backgroundColor = UIColor.clear
        optTwo.backgroundColor = UIColor.clear
        optThree.backgroundColor = UIColor.clear
    }
    
    func updateOptionUI(){
        
        let option = quizBrain.getOptions()
        optOne.setTitle(option.0, for: .normal)
        optTwo.setTitle(option.1, for: .normal) //= option.1
        optThree.setTitle(option.2, for: .normal) //= option.2
        
    }

}

