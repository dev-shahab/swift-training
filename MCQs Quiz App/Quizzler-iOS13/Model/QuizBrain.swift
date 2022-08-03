//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Dev on 03/08/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain{
    let questions = [
        Question(q: "\u{200E}لکھنوؑ میں مزہب کے باعث کون سی صنف شاعری پروان چڑھی؟", a: ["\u{200E}نظم", "\u{200E}رثیہ", "\u{200E} غزل "], correctAnswer: "\u{200E}نظم"),
        Question(q: "\u{200E}کونسا شعری کا دور عہدزریں کہلاتا ہے؟", a: ["\u{200E}دلی کا دور", "\u{200E}شاہ حاتم کا دور", "\u{200E} میر، سودا اور درد کا دور "], correctAnswer: "\u{200E}شاہ حاتم کا دور"),
        Question(q: "\u{200E}اردوکی پہلی نثری داستان کا نام کیا ہے؟", a: ["\u{200E}سب رس", "\u{200E}اغ وبہار", "\u{200E} توتاکہانی"], correctAnswer: "\u{200E}سب رس"),
        Question(q: "\u{200E}لاف کا ہم معنی لفظ کیا ہے؟", a: ["\u{200E}بھاگ دوڑ", "\u{200E}فضول", "\u{200E}شیخی"], correctAnswer: "\u{200E}شیخی"),
        
        Question(q: "\u{200E}ابراہیم ذوق کس کے استاد تھے؟", a: ["\u{200E}الطاف حسین حالی", "\u{200E}بہادر شاہ ظفر", "\u{200E}غالب"], correctAnswer: "\u{200E}بہادر شاہ ظفر"),

        Question(q: "\u{200E}غنی کی جمع ہے؟", a: ["\u{200E}اغناء", "\u{200E}اغنیاء", "\u{200E}غنیات"], correctAnswer: "\u{200E}اغناء"),
        
        Question(q: "\u{200E}محاورہ تین حرف بھیجنا سے کیا مراد ہے؟", a: ["\u{200E}بہت زیادہ پریشان کرنا", "\u{200E}لعنت بھیجنا", "\u{200E}چند روز کا مہمان ہونا"], correctAnswer: "\u{200E}لعنت بھیجنا"),
        
        Question(q: "\u{200E}ق سے ق تک سے کیا مراد ہے؟", a: ["\u{200E}نظر انداز کرنا", "\u{200E}جلدی میں ہونا", "\u{200E}ترک کرنا"], correctAnswer: "\u{200E}جلدی میں ہونا"),

        
        Question(q: "\u{200E}درست ضرب المثل کی نشاندہی کریں؟", a: ["\u{200E}اپنے نین گنوا کے گھرگھر مانگی بھیک", "\u{200E}اپنے نین گنوا کے دردرمانگی بھیگ", "\u{200E}ان میں سے کوئی نہیںا"], correctAnswer: "\u{200E}اپنے نین گنوا کے دردرمانگی بھیگ"),
        
        Question(q: "\u{200E}ق سے ق تک سے کیا مراد ہے؟", a: ["\u{200E}جلدی میں ہونا", "\u{200E}جلدی میں ہونا", "\u{200E}ترک کرنا"], correctAnswer: "\u{200E}جلدی میں ہونا")]
    var questionNumber = 0
    var sccore:Int = 0
    
    mutating func checkAnswer(_ userAnswer:String) -> Bool{
        
        
        if userAnswer == questions[questionNumber].correctAnswer {
            print("Right")
            incSccore()
            print("Increasing Sccore")
            return true
        }
        else{
            print("Wrong")
            print("Not Increasing Sccore")

            return false
        }
        
    }
    
    func getQuestion() -> String {
        
        return questions[questionNumber].question
    }
    
    
    func getProgress() -> Float {
        
        return Float(1)/Float(questions.count)
        
    }
    
    mutating func nextQuestion() {
        
        if questionNumber + 1 < questions.count{
            
            questionNumber += 1
        }
        else{
            questionNumber = 0
            resetSccore()
        }
    }
    
    mutating func incSccore() {
        sccore += 1
    }
    
    func getScore() -> Int {
        return sccore
    }
    
    mutating func resetSccore(){
        sccore = 0
    }
    
    func getOptions() -> (String, String, String){
        return (questions[questionNumber].options![0], questions[questionNumber].options![1],
                questions[questionNumber].options![2])
    }
    
    func areAllaQuestionsCovered() -> Bool{
        if questionNumber == 9{
            return true
        }
        return false
    }
    
    func winningText() -> String{
        return "\u{200E}🙂 آپ جیت گے"
    }
    
    func lostText() -> String{
        
        return "\u{200E}🥲 آپ ہار گے"
    }
    
}
