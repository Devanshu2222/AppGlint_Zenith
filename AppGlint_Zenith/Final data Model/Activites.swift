import UIKit

enum Category {
     case sensory
     case calming
     case interactive
 }
struct Activites {
    let title: String
    let subtitle: String
    let image: UIImage
    let icon: UIImage
    let backgroundColor: UIColor
    let category: Category
    var isFavourite: Bool
    var isParental: Bool
 
}

extension Activites {
    func toGames() -> Games {
        return Games(title: self.title, icon: self.icon, backgroundColor: self.backgroundColor)
    }
}
