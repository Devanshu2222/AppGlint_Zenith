//
//  SurveyViewController.swift
//  AppGlint_Zenith
//
//  Created by Devanshu Singh(chitkara)     on 12/12/24.
//

import UIKit

class SurveyViewController: UIViewController {
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var optionAButtonTapped: UIButton!
    @IBOutlet weak var optionBButtonTapped: UIButton!
    @IBOutlet weak var optionCButtonTapped: UIButton!
    @IBOutlet weak var optionDButtonTapped: UIButton!
    
    // ... other UI elements for different question types
    let autismSurveyManager = AutismSurveyManager()

       override func viewDidLoad() {
           super.viewDidLoad()
           updateUI()
       }

       func updateUI() {
           let currentQuestion = autismSurveyManager.currentQuestion
           QuestionLabel.text = currentQuestion.text

           // Assuming three options for each question
           optionAButtonTapped.isHidden = currentQuestion.options.count < 1
               optionBButtonTapped.isHidden = currentQuestion.options.count < 2
               optionCButtonTapped.isHidden = currentQuestion.options.count < 3
               optionDButtonTapped.isHidden = currentQuestion.options.count < 4
           for (index, button) in [optionAButtonTapped, optionBButtonTapped, optionCButtonTapped, optionDButtonTapped].enumerated() {
                   if index < currentQuestion.options.count {
                       button!.setTitle(currentQuestion.options[index], for: .normal)
                       button!.isHidden = false
                   } else {
                       button!.isHidden = true
                   }
               }

           // Adjust the number of options and button visibility as needed
           optionDButtonTapped.isHidden = currentQuestion.options.count < 4
           if currentQuestion.options.count >= 4 {
               optionDButtonTapped.setTitle(currentQuestion.options[3], for: .normal)
           }
       }

       @IBAction func optionSelected(_ sender: UIButton) {
           let selectedIndex: Int
           switch sender {
           case optionAButtonTapped: selectedIndex = 0
           case optionBButtonTapped: selectedIndex = 1
           case optionCButtonTapped: selectedIndex = 2
           case optionDButtonTapped: selectedIndex = 3
           default: return
           }

           let isCorrect = autismSurveyManager.checkAnswer(selectedIndex)
           sender.backgroundColor = isCorrect ? .systemGreen : .systemRed

           DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
               sender.backgroundColor = .systemGray5

               if self?.autismSurveyManager.isLastQuestion == true {
                   self?.performSegue(withIdentifier: "ResultVC", sender: nil)
               } else {
                   self?.autismSurveyManager.nextQuestion()
                   self?.updateUI()
               }
           }
       }

       // ... other methods and properties
   }
