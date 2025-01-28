import Foundation

class GameManager {
    static let shared = GameManager()
    private var games: [Gamea] = []
    private var dailyPlayTimeLimit: TimeInterval = 7200 // 2 hours default
    
    private init() {}
    
    func addGame(_ game: Gamea) {
        games.append(game)
    }
    
    func getGamesPlayedToday() -> [Gamea] {
        let calendar = Calendar.current
        return games.filter { game in
            calendar.isDateInToday(game.playedDate)
        }
    }
    
    func getTotalPlayTimeToday() -> TimeInterval {
        return getGamesPlayedToday()
            .reduce(0) { $0 + $1.playDuration }
    }
    
    func isPlayTimeExceeded() -> Bool {
        return getTotalPlayTimeToday() >= dailyPlayTimeLimit
    }
    
    func setDailyPlayTimeLimit(_ hours: Double) {
        dailyPlayTimeLimit = hours * 3600
    }
    
    func approveGame(with id: UUID) {
        if let index = games.firstIndex(where: { $0.id == id }) {
            games[index].isParentApproved = true
        }
    }
    
    func getAllGames() -> [Gamea] {
        return games
    }
    
    func removeGame(with id: UUID) {
        games.removeAll { $0.id == id }
    }
} 
