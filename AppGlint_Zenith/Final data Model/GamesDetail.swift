//
//  ActivityModel.swift
//  AppGlint_Zenith
//
//  Created by Devanshu Singh(chitkara)     on 19/12/24.
//

import Foundation

struct Game {
    var id: Int
    var image: String
    var name: String
    var description: String
    var instructions: String?
    var categories: GameCategory
    var gameDuration: Int
    var difficultyLevel: DifficultyLevel?
    var isFavourite: Bool
    var datePlayed: Date?
    var gameType: GameType
    var gameState: GameState
    var startTime: Date?
    var endTime: Date?
    var score: Int?

    enum DifficultyLevel: String {
        case easy
        case medium
        case hard
    }

    enum GameType {
        case parental
        
        case appBased
    }

    enum GameState: String {
        case notStarted
        case inProgress
        case completed
        case paused
    }

    enum GameCategory: String {
        case calming, sensory, interactive
    }
}

let fingerPainting = Game(
    id: 1,
    image: "finger_painting_image.jpg",  // Replace with an actual image URL or file name
    name: "Finger Painting and Footprint Painting",
    description: "A messy but magical art adventure that helps develop sensory awareness and creativity.",
    instructions: """
    1. Prepare the space: Lay newspaper or tarpaulin on the floor for easy cleanup.
    2. Set up materials: Provide paper, safe paints, and a water bowl for rinsing.
    3. Show how it works: Dip hands or feet in paint and press them onto the paper.
    4. Encourage creativity: Let your child mix colors and make patterns freely.
    5. Join the fun: Paint alongside your child to make it a bonding moment.
    6. Talk about the art: Describe the shapes, colors, and patterns together.
    7. Celebrate their work: Display the masterpiece or gift it to someone special.
    """, // Adjust as needed for age range
    categories: .sensory,
    gameDuration: 30,  // Approximate duration in minutes
    difficultyLevel: .easy,
    isFavourite: false,
    datePlayed: nil,
    gameType: .parental,
    gameState: .notStarted
)
let makeMusicalInstruments = Game(
    id: 2,
    image: "musical_instruments_image.jpg",  // Replace with an actual image URL or file name
    name: "Make Your Own Musical Instruments",
    description: "Create, play, and groove with homemade instruments that encourage creativity and teamwork.",
    instructions: """
    1. Gather materials: Grab plastic bottles, rice, wooden spoons, buckets, straws, and tape.
    2. Make a shaker: Fill a bottle with rice, seal it tight, and shake away!
    3. Drum it out: Use wooden spoons to tap on buckets or pots.
    4. Create a recorder: Poke small holes in a straw, then blow to make sounds.
    5. Experiment together: Try other household items to discover new sounds.
    6. Start a jam session: Play your instruments together like a band!
    """,  // Adjust as needed for age range
    categories: .interactive,
    gameDuration: 30,  // Approximate duration in minutes
    difficultyLevel: .medium,
    isFavourite: false,
    datePlayed: nil,
    gameType: .parental,
    gameState: .notStarted
)
let sensoryObjectHunt = Game(
    id: 3,
    image: "sensory_object_hunt_image.jpg",  // Replace with an actual image URL or file name
    name: "Sensory Object Hunt",
    description: "A soothing and calming game where children engage their sense of touch and improve relaxation.",
    instructions: """
    1. Gather a few soft objects from around the house. This can include a soft pillow, a fuzzy blanket, a smooth stone, a plush toy, or a soft scarf.
    2. Blindfold the child or have them close their eyes.
    3. Let them feel the objects one at a time and guess what they are by touch alone. You can also guide them by saying things like, "Is it soft, squishy, or smooth?"
    """,  // Adjust as needed for age range
    categories: .sensory,
    gameDuration: 20,  // Approximate duration in minutes
    difficultyLevel: .easy,
    isFavourite: false,
    datePlayed: nil,
    gameType: .parental,
    gameState: .notStarted
)
let bubbleGame = Game(
    id: 4,
    image: "bubble_game_image.jpg",  // Replace with an actual image URL or file name
    name: "Bubble Game",
    description: "An app-based game where players pop bubbles in different ways to promote focus and relaxation.",
    instructions: "",// Adjust as needed for age range
    categories: .calming,
    gameDuration: 20,  // Approximate duration in minutes
    difficultyLevel: .easy,
    isFavourite: false,
    datePlayed: nil,
    gameType: .appBased,
    gameState: .notStarted
)
let balancingFun = Game(
    id: 5,
    image: "balancing_fun_image.jpg",  // Replace with an actual image URL or file name
    name: "Balancing Fun on One Leg!",
    description: "A fun physical activity to help children improve their balance, focus, and body awareness.",
    instructions: """
    1. Find a Safe Spot: Clear a space with no obstacles. You can use a soft carpet or rug to keep it comfortable and safe.
    2. Stand Tall: Both you and your child stand with feet shoulder-width apart.
    3. Pick a Leg: Ask your child, “Which leg would you like to balance on first?”
    4. Lift the Leg: Have your child slowly lift one leg, bending it at the knee.
    5. Focus on a Spot: Encourage them to look at a specific spot to help with balance.
    6. Hold the Position: Ask them to hold the pose for 5-10 seconds, then switch legs.
    7. Take Deep Breaths: Remind your child to take deep breaths while balancing.
    8. Celebrate the Success: Applaud their effort and try again!
    """,
    categories: .calming,
    gameDuration: 15,  // Approximate duration in minutes
    difficultyLevel: .medium,
    isFavourite: false,
    datePlayed: nil,
    gameType: .parental,
    gameState: .notStarted
)

class GameStore {
    private var games: [Game] = []
    static let shared = GameStore()

    private init() {
        games.append(fingerPainting)
        games.append(makeMusicalInstruments)
        games.append(sensoryObjectHunt)
        games.append(bubbleGame)
        games.append(balancingFun)
    }

    func getAllGames() -> [Game] {
        return games
    }

    func getSchedule(for userId: Int) -> [Game] {
        let availableGames = getAllGames()
        //let scheduleIds = getSchedule(for: userId)
        //return availableGames.filter { scheduleIds.contains(where: $0.id) }
        return availableGames
    }

    func getRecentlyPlayedGames(for userId: Int) -> [Game] {
        let availableGames = getAllGames()
        return availableGames.filter { game in
            game.datePlayed != nil
        }.sorted(by: { $0.datePlayed ?? Date.distantPast > $1.datePlayed ?? Date.distantPast })
    }

    func getFavouriteGames(for userId: Int) -> [Game] {
        let availableGames = getAllGames()
        return availableGames.filter { $0.isFavourite }
    }
}




