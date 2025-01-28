//
//  Questions.swift
//  AppGlint_Zenith
//
//  Created by Devanshu Singh(chitkara)     on 12/12/24.
//
enum QuestionCategory {
    case calming
    case interactive
    case social
    case sensory
}
struct Question {
let text: String
let options: [String]
let correctAnswerIndex: Int
let type: QuestionType
let category: QuestionCategory
}

enum QuestionType {
case multipleChoice
case trueFalse
}

class AutismSurveyManager {
    static let questions = [
        Question(
            text: "Does your child avoid eye contact or seem unaware of others' presence?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .social
        ),
        Question(
            text: "Does your child have difficulty understanding social cues or nonverbal communication?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .social
        ),
        Question(
            text: "Does your child have repetitive behaviors or routines?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .calming
        ),
        Question(
            text: "Does your child have difficulty with imaginative play or pretend scenarios?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .interactive
        ),
        Question(
            text: "Does your child have unusual sensory sensitivities (e.g., strong reactions to sounds, textures, or light)?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .sensory
        ),
        Question(
            text: "Does your child have delayed language development or unusual speech patterns?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .social
        ),
        Question(
            text: "Does your child have difficulty with transitions or changes in routine?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .calming
        ),
        Question(
            text: "Does your child have intense interests or obsessions?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .calming
        ),
        Question(
            text: "Does your child have difficulty understanding and responding to emotions?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .social
        ),
        Question(
            text: "Does your child engage in repetitive motor movements (e.g., hand-flapping, rocking)?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .sensory
        ),
        // Add more questions as needed, considering different aspects of ASD
        Question(
            text: "Does your child have difficulty with problem-solving or planning?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .interactive
        ),
        Question(
            text: "Does your child have difficulty with executive functioning skills (e.g., organization, time management)?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .interactive
        ),
        Question(
            text: "Does your child have difficulty with attention and focus?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .interactive
        ),
        Question(
            text: "Does your child have unusual sensory sensitivities (e.g., oversensitivity to sounds, textures, or light)?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .sensory
        ),
        Question(
            text: "Does your child have difficulty with motor skills (e.g., clumsiness, poor coordination)?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .sensory
        ),
        Question(
            text: "Does your child have unusual eating habits or sensory sensitivities related to food?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .sensory
        ),
        Question(
            text: "Does your child have difficulty with sleep patterns or routines?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .calming
        ),
        Question(
            text: "Does your child have unusual or repetitive speech patterns (e.g., echolalia, idiosyncratic language)?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .social
        ),
        Question(
            text: "Does your child have difficulty with understanding humor or sarcasm?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .social
        ),
        Question(
            text: "Does your child have difficulty with changes in routine or unexpected events?",
            options: ["Yes", "Sometimes", "No"],
            correctAnswerIndex: 0,
            type: .multipleChoice, category: .calming
        )
    ]
    
    var currentQuestionIndex = 0
    var totalCorrectAnswers = 0
    
    var currentQuestion: Question {
        return AutismSurveyManager.questions[currentQuestionIndex]
    }
    
    var isLastQuestion: Bool {
        return currentQuestionIndex == AutismSurveyManager.questions.count - 1
    }
    
    func checkAnswer(_ selectedIndex: Int) -> Bool {
        let isCorrect = selectedIndex == currentQuestion.correctAnswerIndex
        if isCorrect {
            totalCorrectAnswers += 1
        }
        return isCorrect
    }
    
    func nextQuestion() {
        currentQuestionIndex += 1
    }
    
    func calculateScore() -> Int {
        return totalCorrectAnswers
    }
}



