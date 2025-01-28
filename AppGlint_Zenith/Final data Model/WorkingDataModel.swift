import UIKit

// MARK: - User Data Model
struct UserData {
    var childName: String
    var childAge: Int
    var parentEmail: String
    var autismCategory: String?
    var phone: String?
}

// MARK: - UserDataManager
class UserDataManager {
    static let shared = UserDataManager() // Singleton instance
    
    private init() {} // Prevent instantiation from outside
    
    private var userDataStorage: [String: Any] = [:] // Dictionary for storing user data
    private var recentGames: [Activites] = [] // Stores recently played games
    private var favGames: [Activites] = []
    
    // MARK: - All Games Array
    var allGames: [Activites] = [

        // Calming Games
        (Activites(title: "Popping Bubbles (App-Based)", subtitle: "Helps children practice focus by guiding them to tap and pop virtual bubbles", image: UIImage(named: "calming_1") ?? defaultImage, icon: UIImage(systemName: "bubble.fill") ?? defaultImage, backgroundColor: UIColor.systemBlue, category: .calming, isFavourite: false, isParental: false)),
        (Activites(title: "Flow Free", subtitle: "Connect matching colors with pipes to create a flow. It's simple and stress-free.", image: UIImage(named: "calming_2") ?? defaultImage, icon: UIImage(systemName: "paintbrush") ?? defaultImage, backgroundColor: UIColor.systemGreen, category: .calming, isFavourite: false, isParental: false)),
        (Activites(title: "Finger Tracing Maze", subtitle: "Improve motor skills and focus", image: UIImage(named: "calming_3") ?? defaultImage, icon: UIImage(systemName: "maze") ?? defaultImage, backgroundColor: UIColor.systemIndigo, category: .calming, isFavourite: false, isParental: true)),
        (Activites(title: "Feather Balance Challenge", subtitle: "Practice patience and focus", image: UIImage(named: "calming_4") ?? defaultImage, icon: UIImage(systemName: "feather") ?? defaultImage, backgroundColor: UIColor.systemPurple, category: .calming, isFavourite: false, isParental: true)),

        // Sensory Games
        (Activites(title: "Sensory Fidget (App-Based)", subtitle: "Virtual fidget toys to mimic physical sensory toys", image: UIImage(named: "sensory_1") ?? defaultImage, icon: UIImage(systemName: "gearshape.fill") ?? defaultImage, backgroundColor: UIColor.systemOrange, category: .sensory, isFavourite: false, isParental: false)),
        (Activites(title: "PeekaBoo Barn (App-Based)", subtitle: "Learn about animals and their sounds", image: UIImage(named: "sensory_2") ?? defaultImage, icon: UIImage(systemName: "house") ?? defaultImage, backgroundColor: UIColor.systemYellow, category: .sensory, isFavourite: false, isParental: false)),
        (Activites(title: "Sensory Bin Exploration", subtitle: "Explore textures and practice sorting", image: UIImage(named: "sensory_3") ?? defaultImage, icon: UIImage(systemName: "box") ?? defaultImage, backgroundColor: UIColor.systemPink, category: .sensory, isFavourite: false, isParental: true)),
        (Activites(title: "Shaving Cream Sensory Play", subtitle: "Explore textures and practice creativity", image: UIImage(named: "sensory_4") ?? defaultImage, icon: UIImage(systemName: "paintbrush") ?? defaultImage, backgroundColor: UIColor.systemRed, category: .sensory, isFavourite: false, isParental: true)),

        // Interactive Games
       (Activites(title: "Breathe, Think, Do with Sesame", subtitle: "Learn problem-solving and emotional regulation", image: UIImage(named: "interactive_1") ?? defaultImage, icon: UIImage(systemName: "brain.head") ?? defaultImage, backgroundColor: UIColor.systemTeal, category: .interactive, isFavourite: false, isParental: false)),
       (Activites(title: "Charades for Kids", subtitle: "Act out or guess words or phrases", image: UIImage(named: "interactive_2") ?? defaultImage, icon: UIImage(systemName: "theatermasks") ?? defaultImage, backgroundColor: UIColor.systemPurple, category: .interactive, isFavourite: false, isParental: false)),
        (Activites(title: "Follow the Leader", subtitle: "Improve coordination and listening skills", image: UIImage(named: "interactive_3") ?? defaultImage, icon: UIImage(systemName: "person.3.fill") ?? defaultImage, backgroundColor: UIColor.systemGreen, category: .interactive, isFavourite: false, isParental: true)),
       (Activites(title: "Simon Says", subtitle: "Test listening skills and quick thinking", image: UIImage(named: "interactive_4") ?? defaultImage, icon: UIImage(systemName: "ear") ?? defaultImage, backgroundColor: UIColor.systemBlue, category: .interactive, isFavourite: false, isParental: true))

        ]

    // MARK: - Populate Schedule Based on Category
    func populateSchedule(by category: Category) {
        schedule = allGames.filter { $0.category == category }
        print("Schedule updated with category: \(category), total games: \(schedule.count)")
    }
    
    
    
    func populateFav() {
        favGames.removeAll() // Clear existing data
        favGames = schedule.filter { $0.isFavourite }
        print("Populated Fav Games: \(favGames.count)")
    }

 
    // MARK: - User Data Methods
    
    func saveUserData(childName: String, childAge: Int, parentEmail: String, phone: String) {
        let userData = UserData(childName: childName, childAge: childAge, parentEmail: parentEmail, autismCategory: nil, phone: phone)
        userDataStorage["userData"] = userData
        print("Saved User Data: \(userData)") // Debugging log
    }
    
    func getUserData() -> UserData? {
        let userData = userDataStorage["userData"] as? UserData
        print("Retrieved User Data: \(String(describing: userData))") // Debugging log
        return userData
    }
    
    func saveAutismCategory(_ category: String) {
        if var userData = userDataStorage["userData"] as? UserData {
            userData.autismCategory = category
            userDataStorage["userData"] = userData
        }
    }
    
    func getAutismCategory() -> String? {
        return (userDataStorage["userData"] as? UserData)?.autismCategory
    }
    
    func getAllGames() -> [Activites] {
        return allGames
    }
    
    func getGames() -> [Games] {
        return games
    } 
    // MARK: - Recent Games Methods
    
    // Add a game to recent games
    func addRecentGame(_ game: Activites) {
            if !recentGames.contains(where: { $0.title == game.title }) {
                recentGames.insert(game, at: 0) // Add at the top
            }
            
            if recentGames.count > 10 { // Keep only last 10 games
                recentGames.removeLast()
            }
            
            print("Added recent game: \(game.title)")
        }
    
    // Retrieve recent games
    // Retrieve a specific recent game by index
    func getRecentGame(at index: Int) -> Activites? {
        guard index >= 0, index < recentGames.count else {
            print("Invalid index. No game found.")
            return nil
        }
        let game = recentGames[index]
        print("Retrieved game at index \(index): \(game.title)")
        return game
    }

    func getRecentGames() -> [Activites] {
        print("Retrieved recent games: \(recentGames.map { $0.title })")
        return recentGames
    }
    //MARK: Favourite Games
    func toggleFavourite(gameTitle: String) {
        if let index = schedule.firstIndex(where: { $0.title == gameTitle }) {
            schedule[index].isFavourite.toggle()
            print("Toggled favourite status for \(gameTitle). Now: \(schedule[index].isFavourite ? "Favourite" : "Not Favourite")")
        } else {
            print("Game not found in schedule.")
        }
    }
    func getFavourite(gameTitle: String) -> Bool? {
            // Search the schedule array for the game with the given title
            if let game = schedule.first(where: { $0.title == gameTitle }) {
                print("Favourite status for \(gameTitle): \(game.isFavourite ? "Favourite" : "Not Favourite")")
                return game.isFavourite
            } else {
                print("Game with title \(gameTitle) not found.")
                return nil
            }
        }
//    func getFavGame(at index: Int) -> Activites? {
//        guard index >= 0, index < favGames.count else {
//            print("Invalid index. No favorite game found.")
//            return nil
//        }
//        let game = favGames[index]
//        print("Retrieved favorite game at index \(index): \(game.title)")
//        return game
//    }
    func getFavGame() -> [Activites] {
        print("Retrieved Fav games: \(favGames.map { $0.title })")
        return favGames
    }

    
    func getFavouriteGames() -> [Activites] {
            return schedule.filter { $0.isFavourite }
        }
    
    func countFavGames() -> Int {
        return favGames.count
    }
}
//MARK: -Games Data model

struct Schedule {
    var id: Int
    var date: Date
    var gameToBePlayedIds: [Int]
}

// Function to create a DateFormatter
func createDateFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    return dateFormatter
}



// Example date of birth
let DOB: Date? = createDateFormatter().date(from: "09-09-2004")

// MARK:Data Initialization
let defaultImage = UIImage(systemName: "questionmark.square.fill")!

var schedule: [Activites] = [
    Activites(title: "Fidget toys",
                     subtitle: "Reduce anxiety.",
                     image: UIImage(named: "Bubble_game") ?? defaultImage,
                     icon: UIImage(systemName: "hands.sparkles") ?? defaultImage,
                     backgroundColor: UIColor.systemBlue,
              category: .sensory, isFavourite: false, isParental: false),
    
    Activites(title: "Stress Ball",
                     subtitle: "Relieves stress.",
                     image: UIImage(named: "painting_1") ?? defaultImage,
                     icon: UIImage(systemName: "circle.fill") ?? defaultImage,
                     backgroundColor: UIColor.systemRed,
              category: .calming, isFavourite: false, isParental: false),
    
    Activites(title: "Spinner",
                     subtitle: "Focus aid.",
                     image: UIImage(named: "objecthunt") ?? defaultImage,
                     icon: UIImage(systemName: "arrow.triangle.2.circlepath") ?? defaultImage,
                     backgroundColor: UIColor.systemGreen,
              category: .interactive, isFavourite: false, isParental: false),
    
    Activites(title: "Puzzle",
                     subtitle: "Engages the mind.",
                     image: UIImage(named: "musicalgame") ?? defaultImage,
                     icon: UIImage(systemName: "puzzlepiece.fill") ?? defaultImage,
                     backgroundColor: UIColor.systemPurple,
              category: .interactive, isFavourite: false, isParental: false)
]


var games: [Games] = [
    Games(title: "Bubble Game",
          icon: UIImage(systemName: "bubble.right.fill") ?? defaultImage,
          backgroundColor: .systemPurple),
    Games(title: "Snake",
          icon: UIImage(systemName: "arrowshape.turn.up.right.circle.fill") ?? defaultImage,
          backgroundColor: .systemGreen),
    Games(title: "Tic Tac Toe",
          icon: UIImage(systemName: "circle.grid.cross") ?? defaultImage,
          backgroundColor: .systemBlue),
    Games(title: "Trivia Quiz",
          icon: UIImage(systemName: "questionmark.circle.fill") ?? defaultImage,
          backgroundColor: .systemPink),
    Games(title: "Chat",
          icon: UIImage(systemName: "message.fill") ?? defaultImage,
          backgroundColor: .systemTeal)
]

var favouriteGames: [Games] = [
    Games(title: "Memory Game",
          icon: UIImage(systemName: "brain.head.profile") ?? defaultImage,
          backgroundColor: .systemIndigo),
    Games(title: "Puzzle",
          icon: UIImage(systemName: "puzzlepiece.fill") ?? defaultImage,
          backgroundColor: .systemOrange),
    Games(title: "Chess",
          icon: UIImage(systemName: "crown.fill") ?? defaultImage,
          backgroundColor: .systemGray),
    Games(title: "Sudoku",
          icon: UIImage(systemName: "rectangle.split.3x3.fill") ?? defaultImage,
          backgroundColor: .systemRed),
    Games(title: "Card Match",
          icon: UIImage(systemName: "suit.club.fill") ?? defaultImage,
          backgroundColor: .systemYellow)
]
func getSchedule() -> [Schedule] {
    // Create a DateFormatter for parsing dates
    let dateFormatter = createDateFormatter()
    
    // Example schedule dates
    let exampleDates: [String] = ["20-01-2025", "21-01-2025", "22-01-2025", "23-01-2025"]
    let parsedDates: [Date] = exampleDates.compactMap { dateFormatter.date(from: $0) }
    
    // Map schedule titles to their corresponding game IDs
    var gameTitleToIdMap: [String: Int] = [:]
    for (index, game) in games.enumerated() {
        gameTitleToIdMap[game.title] = index
    }
    
    // Build the schedule array
    var schedules: [Schedule] = []
    for (index, cellData) in schedule.enumerated() {
        guard index < parsedDates.count else { break }
        
        let gameIds = gameTitleToIdMap.filter { cellData.title.contains($0.key) }.map { $0.value }
        let scheduleItem = Schedule(
            id: index + 1,
            date: parsedDates[index],
            gameToBePlayedIds: gameIds
        )
        schedules.append(scheduleItem)
    }
//    func filterGamesByCategory(category: Activites.Category) -> [Activites] {
//        return schedule.filter { $0.category == category }
//    }
//
//    func updateSchedule(withFilteredGames filteredGames: [Activites]) {
//        // Clear the existing schedule to avoid duplicates.
//        schedule.removeAll()
//        
//        // Add the filtered games to the schedule.
//        schedule.append(contentsOf: filteredGames)
//        
//        // Convert Activites.Category to String for better readability
//        let categoryString = String(describing: category)
//        print("Schedule updated with filtered games from category: \(categoryString). Total games: \(schedule.count)")
//    }
//
//    // Example usage
//    let calmingGames = filterGamesByCategory(category: .calming)
//    // Update the schedule with the filtered calming games
//    updateSchedule(withFilteredGames: calmingGames)
//
//    // Access and use the updated schedule
//    for game in schedule {
//        print(game.title)
//    }
    
    return schedules
}


