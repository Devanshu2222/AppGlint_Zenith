//import Foundation
//import UIKit // Required for UIImage and UIColor
//
//// MARK: - Schedule Struct
////struct Schedule {
//    var id: Int
//    var date: Date
//    var gameToBePlayedIds: [Int]
//}
//
//// Function to create a DateFormatter
//func createDateFormatter() -> DateFormatter {
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "dd-MM-yyyy"
//    return dateFormatter
//}
//
//// Example date of birth
//let DOB: Date? = createDateFormatter().date(from: "09-09-2004")
//
//// MARK: - Data Initialization
//let defaultImage = UIImage(systemName: "questionmark.square.fill")!
//
//var schedule: [scheduleCellData] = [
//    scheduleCellData(title: "Fidget toys",
//                     subtitle: "Reduce anxiety.",
//                     image: UIImage(named: "Bubble_game") ?? defaultImage,
//                     icon: UIImage(systemName: "hands.sparkles") ?? defaultImage,
//                     backgroundColor: UIColor.systemBlue),
//    
//    scheduleCellData(title: "Stress Ball",
//                     subtitle: "Relieves stress.",
//                     image: UIImage(named: "painting_1") ?? defaultImage,
//                     icon: UIImage(systemName: "circle.fill") ?? defaultImage,
//                     backgroundColor: UIColor.systemRed),
//    
//    scheduleCellData(title: "Spinner",
//                     subtitle: "Focus aid.",
//                     image: UIImage(named: "objecthunt") ?? defaultImage,
//                     icon: UIImage(systemName: "arrow.triangle.2.circlepath") ?? defaultImage,
//                     backgroundColor: UIColor.systemGreen),
//    
//    scheduleCellData(title: "Puzzle",
//                     subtitle: "Engages the mind.",
//                     image: UIImage(named: "musicalgame") ?? defaultImage,
//                     icon: UIImage(systemName: "puzzlepiece.fill") ?? defaultImage,
//                     backgroundColor: UIColor.systemPurple)
//]
//
//var games: [Games] = [
//    Games(title: "Bubble Game",
//          icon: UIImage(systemName: "bubble.right.fill") ?? defaultImage,
//          backgroundColor: .systemPurple),
//    Games(title: "Snake",
//          icon: UIImage(systemName: "arrowshape.turn.up.right.circle.fill") ?? defaultImage,
//          backgroundColor: .systemGreen),
//    Games(title: "Tic Tac Toe",
//          icon: UIImage(systemName: "circle.grid.cross") ?? defaultImage,
//          backgroundColor: .systemBlue),
//    Games(title: "Trivia Quiz",
//          icon: UIImage(systemName: "questionmark.circle.fill") ?? defaultImage,
//          backgroundColor: .systemPink),
//    Games(title: "Chat",
//          icon: UIImage(systemName: "message.fill") ?? defaultImage,
//          backgroundColor: .systemTeal)
//]
//
//var favouriteGames: [Games] = [
//    Games(title: "Memory Game",
//          icon: UIImage(systemName: "brain.head.profile") ?? defaultImage,
//          backgroundColor: .systemIndigo),
//    Games(title: "Puzzle",
//          icon: UIImage(systemName: "puzzlepiece.fill") ?? defaultImage,
//          backgroundColor: .systemOrange),
//    Games(title: "Chess",
//          icon: UIImage(systemName: "crown.fill") ?? defaultImage,
//          backgroundColor: .systemGray),
//    Games(title: "Sudoku",
//          icon: UIImage(systemName: "rectangle.split.3x3.fill") ?? defaultImage,
//          backgroundColor: .systemRed),
//    Games(title: "Card Match",
//          icon: UIImage(systemName: "suit.club.fill") ?? defaultImage,
//          backgroundColor: .systemYellow)
//]
//func getSchedule() -> [Schedule] {
//    // Create a DateFormatter for parsing dates
//    let dateFormatter = createDateFormatter()
//    
//    // Example schedule dates
//    let exampleDates: [String] = ["20-01-2025", "21-01-2025", "22-01-2025", "23-01-2025"]
//    let parsedDates: [Date] = exampleDates.compactMap { dateFormatter.date(from: $0) }
//    
//    // Map schedule titles to their corresponding game IDs
//    var gameTitleToIdMap: [String: Int] = [:]
//    for (index, game) in games.enumerated() {
//        gameTitleToIdMap[game.title] = index
//    }
//    
//    // Build the schedule array
//    var schedules: [Schedule] = []
//    for (index, cellData) in schedule.enumerated() {
//        guard index < parsedDates.count else { break }
//        
//        let gameIds = gameTitleToIdMap.filter { cellData.title.contains($0.key) }.map { $0.value }
//        let scheduleItem = Schedule(
//            id: index + 1,
//            date: parsedDates[index],
//            gameToBePlayedIds: gameIds
//        )
//        schedules.append(scheduleItem)
//    }
//    
//    return schedules
//}
//
