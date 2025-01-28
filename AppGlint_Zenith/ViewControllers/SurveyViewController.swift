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
    
    let autismSurveyManager = AutismSurveyManager()
        var surveyAnswers: [ResultViewController.SurveyAnswer] = [] // Store answers

        override func viewDidLoad() {
            super.viewDidLoad()
            if let userData = UserDataManager.shared.getUserData() {
                        print("Child Name: \(userData.childName)")
                        print("Child Age: \(userData.childAge)")
                        print("Parent Email: \(userData.parentEmail)")
                        
                        // Use the data to personalize the screen, e.g., showing the child's name
                        self.title = "Welcome, \(userData.childName)!"
                    } else {
                        print("No user data found!")
                    }
            updateUI()
        }

        func updateUI() {
            let currentQuestion = autismSurveyManager.currentQuestion
            QuestionLabel.text = currentQuestion.text

            let optionButtons = [optionAButtonTapped, optionBButtonTapped, optionCButtonTapped, optionDButtonTapped]
            for (index, button) in optionButtons.enumerated() {
                if index < currentQuestion.options.count {
                    button?.setTitle(currentQuestion.options[index], for: .normal)
                    button?.isHidden = false
                    button?.backgroundColor = .systemGray5
                } else {
                    button?.isHidden = true
                }
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

            // Store answer
            let currentQuestion = autismSurveyManager.currentQuestion
            let isCorrect = (selectedIndex == currentQuestion.correctAnswerIndex)
            let answer = ResultViewController.SurveyAnswer(
                questionId: autismSurveyManager.currentQuestionIndex,
                selectedOption: selectedIndex,
                isTrue: isCorrect,  // If needed, assign the correctness result
                answerText: nil     // Keeping answerText nil
            )

            surveyAnswers.append(answer)

            // Proceed to next question
            if autismSurveyManager.isLastQuestion {
                performSegue(withIdentifier: "ResultVC", sender: nil)
            } else {
                autismSurveyManager.nextQuestion()
                updateUI()
            }
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ResultVC",
               let resultVC = segue.destination as? ResultViewController {
                resultVC.surveyAnswers = surveyAnswers
            }
        }
       // ... other methods and properties
   }
