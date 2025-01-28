import Foundation

struct ExpoGame {
    let name: String
    let description: String
    let image: String
    let isParental: Bool
    
    var emoji: String {
        return isParental ? "👨‍👩‍👧‍👦" : "📱"
    }
}
