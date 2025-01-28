//
//  ResultViewController.swift
//  AppGlint_Zenith
//
//  Created by Devanshu Singh(chitkara)     on 12/12/24.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultTextView: UITextView!
    
//    @IBOutlet weak var gamesCollectionView: UICollectionView!
        
        struct SurveyAnswer {
            let questionId: Int
            let selectedOption: Int?
            let isTrue: Bool?  // Ensure these properties are optional
            let answerText: String?
        }
        
        var surveyAnswers: [SurveyAnswer] = []
        var recommendedGames: [Games] = []
        
        override func viewDidLoad() { 
            super.viewDidLoad()
            //setupCollectionView()
            displayResults()
        }
        
//        private func setupCollectionView() {
//            gamesCollectionView.delegate = self
//            gamesCollectionView.dataSource = self
//            gamesCollectionView.register(GameCell.self, forCellWithReuseIdentifier: GameCell.identifier)
//        }
        
        private func displayResults() {
            let scores = calculateCategoryScores()
            resultTextView.text = generateResultText(for: scores)
            recommendedGames = getRecommendedGames(for: scores)
            //gamesCollectionView.reloadData()
        }
        
        private func calculateCategoryScores() -> (calming: Int, interactive: Int, social: Int, sensory: Int) {  
            var scores = (calming: 0, interactive: 0, social: 0, sensory: 0)
            for answer in surveyAnswers {
                let question = AutismSurveyManager.questions[answer.questionId]
                if answer.selectedOption == question.correctAnswerIndex {
                    switch question.category {
                    case .calming: scores.calming += 1
                    case .interactive: scores.interactive += 1
                    case .social: scores.social += 1
                    case .sensory: scores.sensory += 1
                    }
                }
            }
            return scores
        }
        
    private func generateResultText(for scores: (calming: Int, interactive: Int, social: Int, sensory: Int)) -> String {
        var text = "Your child's profile:\n\n"
        
        if scores.calming >= 5 {
            text += "Calming activities recommended.\n"
        } else {
            text += "Your child may not require extensive calming activities, but occasional relaxation exercises could be beneficial.\n"
        }
        
        if scores.interactive >= 5 {
            text += "Interactive experiences recommended.\n"
        } else {
            text += "Limited need for interactive experiences, but structured engagement might help.\n"
        }
        
        if scores.social >= 5 {
            text += "Social skill support recommended.\n"
        } else {
            text += "Social skills appear balanced, but occasional peer interactions could be helpful.\n"
        }
        
        if scores.sensory >= 5 {
            text += "Sensory-friendly environment recommended.\n"
        } else {
            text += "Your child may not require a sensory-friendly setup, but some sensory considerations might still be useful.\n"
        }
        
        // Determine the dominant category
        let categories = [
            "Calming": scores.calming,
            "Interactive": scores.interactive,
            "Social": scores.social,
            "Sensory": scores.sensory
        ]
        
        let category = categories.max { $0.value < $1.value }?.key ?? "None"
        UserDataManager.shared.saveAutismCategory(category)
        return text + "\nDominant Category: \(category)"
    }


        
        private func getRecommendedGames(for scores: (calming: Int, interactive: Int, social: Int, sensory: Int)) -> [Games] {
            var recommended = [Games]()
            if scores.calming > 5 { recommended.append(contentsOf: games.filter { $0.title.contains("Bubble") }) }
            if scores.interactive > 5 { recommended.append(contentsOf: games.filter { $0.title.contains("Chat") }) }
            if scores.social > 5 { recommended.append(contentsOf: games.filter { $0.title.contains("Trivia") }) }
            if scores.sensory > 5 { recommended.append(contentsOf: games.filter { $0.title.contains("Puzzle") }) }
            return recommended
        }
    }

    extension ResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return recommendedGames.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.identifier, for: indexPath) as! GameCell
            cell.configure(with: recommendedGames[indexPath.item])
            return cell
        }
        @IBAction func DoneButtonTapped(_ sender: Any) {
               let storyboard = UIStoryboard(name: "Home", bundle: nil)
                       let HomeTBC = storyboard.instantiateViewController(withIdentifier: "tabBarVC") as! UITabBarController

                       let categoryScores = calculateCategoryScores()
                       UserDefaults.standard.set(categoryScores.calming, forKey: "calmingScore")
                       UserDefaults.standard.set(categoryScores.interactive, forKey: "interactiveScore")
                       UserDefaults.standard.set(categoryScores.social, forKey: "socialScore")
                       UserDefaults.standard.set(categoryScores.sensory, forKey: "sensoryScore")

                       HomeTBC.modalPresentationStyle = .fullScreen
                       present(HomeTBC, animated: true)
           }
    }


