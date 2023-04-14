//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var TrueButton: UIButton!
    @IBOutlet weak var FalseButton: UIButton!
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    @IBOutlet weak var Scorepoints: UILabel!
    var quizeBrain = QuizeBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Scorepoints.text  = "score: 0"
        UpdateUI()
    }
    
    @IBAction func AnswerButtonPressed(_ sender: UIButton) {
        let UserAnswer = sender.currentTitle
        let userGotItRight = quizeBrain.checkAnswer(UserAnswer!)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }
        else
        {
            sender.backgroundColor = UIColor.red
        }
        quizeBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2,target: self, selector:#selector(UpdateUI),userInfo : nil , repeats: false )
        
    }
    @objc func UpdateUI(){
        
        QuestionLabel.text = quizeBrain.getQuestionText()
        TrueButton.backgroundColor = UIColor.clear
        FalseButton.backgroundColor = UIColor.clear
        Scorepoints.text = quizeBrain.getscore()
        ProgressBar.progress = quizeBrain.getProgress()
        
        
        
        
    }
}

