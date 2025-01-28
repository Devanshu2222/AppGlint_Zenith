import UIKit

struct Games {
    let title: String
    let icon: UIImage
    let backgroundColor: UIColor
//    let category: String
}
struct Gamea {
    let id: UUID
    var title: String
    var playedDate: Date
    var notes: String?
    var ageRating: String
    var playDuration: TimeInterval
    var isParentApproved: Bool
    
    init(id: UUID = UUID(),
         title: String,
         playedDate: Date = Date(),
         notes: String? = nil,
         ageRating: String = "E",
         playDuration: TimeInterval = 0,
         isParentApproved: Bool = false) {
        self.id = id
        self.title = title
        self.playedDate = playedDate
        self.notes = notes
        self.ageRating = ageRating
        self.playDuration = playDuration
        self.isParentApproved = isParentApproved
    }
}
