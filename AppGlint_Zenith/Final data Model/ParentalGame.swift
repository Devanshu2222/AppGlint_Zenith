//
//  ParentalGame.swift
//  AppGlint_Zenith
//
//  Created by student-2 on 20/01/25.
//

import Foundation
struct Step {
    let title: String
    let subtitle: String
    let image: String // Image name or SF Symbol name
    var markedDone: Bool
}
var steps: [Step] = [
    Step(title: "Give your child a toy",
         subtitle: "Choose a favorite toy that your child enjoys playing with",
         image: "home.fill", markedDone: false),
    Step(title: "Create a calm environment",
         subtitle: "Find a quiet space free from distractions to help your child focus on the activity",
         image: "star.fill", markedDone: false),
    Step(title: "Let him play!",
         subtitle: "Find a quiet space free from distractions to help your child focus on the activity",
         image: "star.fill", markedDone: false)
]
