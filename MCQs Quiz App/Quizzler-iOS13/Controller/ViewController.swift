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
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    var quizBrain:QuizBrain = QuizBrain()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = quizBrain.getQuestion() //questions[0].question
        progressView.progress = 0
        sccoreView.text = "Sccore: " + String(quizBrain.getScore())
    }

    
    @IBAction func answerButton(_ sender: UIButton) {
        
        
        if quizBrain.checkAnswer(sender.currentTitle!){
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block:
                                {_ in
            self.updateQuestionUI()
        })
        //timer.invalidate() Yeh yahan Likhna galat hai bcoz
        //Agr ham isko chalaa deyn to timer to background me chall raha hai
        //but jessey hi compiler next line per jaayga woh timer ko background se invalidate karrdeyga or phr color change ni hoga

    }
    
    
    func updateQuestionUI(){
        
        questionText.text = quizBrain.getQuestion()
        progressView.progress += quizBrain.getProgress()
        quizBrain.nextQuestion()
        sccoreView.text = "Sccore: " +  String(quizBrain.getScore())
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        timer?.invalidate()
        
    }
    

}

