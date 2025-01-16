//
//  ResultViewController.swift
//  AppGlint_Zenith
//
//  Created by Devanshu Singh(chitkara)     on 12/12/24.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultTextView: UITextView!
    
    
    struct SurveyAnswer {
         let questionId: Int
         let selectedOption: Int? // For multiple-choice questions
         let isTrue: Bool? // For true/false questions
         let answerText: String? // For open-ended questions
     }
    var surveyAnswers: [SurveyAnswer] = []
        var totalQuestions = AutismSurveyManager.questions.count

        override func viewDidLoad() {
            super.viewDidLoad()

            let score = calculateScore()

            // Display the result and provide feedback
            resultTextView.text = "Your Score: \(score)/\(totalQuestions)\n\n"

            if score >= 15 {
                resultTextView.text += "Your child may exhibit signs of Autism Spectrum Disorder. It's recommended to consult with a healthcare professional for a proper evaluation."
            } else if score >= 10 {
                resultTextView.text += "Your child may show some traits associated with Autism Spectrum Disorder. Consider consulting with a healthcare professional for further assessment."
            } else {
                resultTextView.text += "While your child may not show significant signs of Autism Spectrum Disorder, it's always a good idea to monitor their development and consult with a pediatrician if you have any concerns."
            }
        }

    func calculateScore() -> Int {
        var score = 0
        for (index, answer) in surveyAnswers.enumerated() {
            let question = AutismSurveyManager.questions[index]

            switch question.type {
            case .multipleChoice:
                if let selectedOption = answer.selectedOption, selectedOption == question.correctAnswerIndex {
                    score += 1
                }
            case .trueFalse:
                if let isTrue = answer.isTrue, isTrue == (question.correctAnswerIndex == 1) {
                    score += 1
                }
            }
        }
        return score
    }
    @IBAction func DoneButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let HomeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        HomeVC.modalPresentationStyle = .fullScreen
//        performSegue(withIdentifier: "Survey", sender: self)
        present(HomeVC.self , animated: true)
    }
}

 
