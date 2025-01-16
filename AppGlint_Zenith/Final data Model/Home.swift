import Foundation

// MARK: - Schedule Struct
struct Schedule {
    var id : Int
    var date: Date
    var gameToBePlayedIds: [Int]
}

// Function to create a DateFormatter
func createDateFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    return dateFormatter
}

let DOB: Date? = createDateFormatter().date(from: "09-09-2004")
