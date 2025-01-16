//
//  Dataa.swift
//  AppGlint_Zenith
//
//  Created by student-2 on 19/12/24.
//

//import Foundation
//
//// MARK: - User Model
//struct User {
//    var id: Int
//    var name: String
//    var email: String
//    var phone: String
//    var address: String
//    var dateOfBirth: Date?
//    var profilePictureURL: String?
//    var userProfileId: Int  // Reference to the user's profile (via ID)
//}
//func createDateFormatter() -> DateFormatter {
//  let dateFormatter = DateFormatter()
//  dateFormatter.dateFormat = "dd-MM-yyyy"
//  return dateFormatter
//}
//let DOB: Date? = createDateFormatter().date(from: "09-09-2004")
//
//
//let FirstUser = User(
//    id: 20,
//    name: "Devanshu Sing",
//    email: "devanshu9992@gmail.com",
//    phone: "9023822220",
//    address: "367 new guru arjun dev colony",
//    dateOfBirth: DOB,
//    profilePictureURL: nil,
//    userProfileId: 1)
//
//class UserDataModel{
//    private var users: [User] = []
//    static let shared = UserDataModel()//singoleton instance (shared instance of userdatamodel that globally accessed)
//    private init(){// this ensures that no part of code can create new instance of this
//        users.append(FirstUser)
//      func getProfileId(by userProfileId: Int) -> Int {
//          return userProfileId
//           }
//    }
//
//    func getUsers() -> [User]{
//        return users
//    }
//
//    func getRecentlyPlayedGames(userProfiles: [UserProfile]) -> [Game] {
//        if let profile = userProfiles.first(where: { $0.id == userProfileId }) {
//               return profile.getRecentlyPlayedGames()
//           }
//           return []
//       }
//    func getFavoriteGames(userProfiles: [UserProfile]) -> [Game] {
//            if let profile = userProfiles.first(where: { $0.id == userProfileId }) {
//                return profile.getFavoriteGames()
//            }
//            return []
//        }
//}
//
//// MARK: - UserProfile Model
//struct UserProfile {
//    var id: Int
//    var user: User
//    var child: Child
//    var completedSurveys: [Survey]
//    var playedGames: [Game]
//    var preferredGameCategories: [String]
//    var recentActivities: [Activity]
//    var schedule: [Schedule]
//    var screenTimeLimit: Int?
//}
//let FirstUserProfile = UserProfile(
//    id: 1,
//    user: UserDataModel.shared.users[0],
//    child: ChildDataModel.shared.children[0],
//    completedSurveys: [],
//    playedGames: [],
//    preferredGameCategories: [],
//    recentActivities: [],
//    schedule: [],
//    screenTimeLimit: nil
//    )
//
//class UserProfileDataModel{
//    private var userProfiles: [UserProfile] = []
//    static let shared = UserProfileDataModel()
//    private init(){
//        userProfiles.append(FirstUserProfile)
//    }
//    func
//}
//    struct Schedule {
//        var date: Date
//        var activities: [Activity]
//        var startTime: Date
//        var endTime: Date
//
//        struct Activity {
//            var activityType: ActivityType
//            var description: String
//            var duration: Int
//        }
//
//        enum ActivityType: String {
//            case therapySession
//            case game
//            case survey
//            case exercise
//            case other
//        }
//    }
//
//    func getSchedule(forDate date: Date) -> Schedule? {
//        return schedule.first(where: { Calendar.current.isDate($0.date, inSameDayAs: date) })
//    }
//
//    func getRecentlyPlayedGames() -> [Game] {
//        return playedGames.filter { $0.gameState == .completed }
//    }
//
//    func getFavoriteGames() -> [Game] {
//        return playedGames.filter { $0.isFavourite }
//    }
//    struct Survey {
//        var id: Int
//        var title: String
//        var description: String
//        var questions: [SurveyQuestion]
//        var surveyDate: Date
//        var completionStatus: SurveyCompletionStatus
//
//        enum SurveyCompletionStatus: String {
//            case notStarted
//            case inProgress
//            case completed
//            case archived
//        }
//
//        mutating func updateCompletionStatus(to status: SurveyCompletionStatus) {
//            self.completionStatus = status
//        }
//
//        mutating func addQuestion(question: SurveyQuestion) {
//            questions.append(question)
//        }
//
//        mutating func removeQuestion(byId questionId: Int) {
//            questions.removeAll { $0.id == questionId }
//        }
//    }
//
//    struct SurveyQuestion {
//        var id: Int
//        var questionText: String
//        var type: QuestionType
//        var options: [String]?
//        var isMandatory: Bool
//
//        enum QuestionType: String {
//            case multipleChoice
//            case trueFalse
//            case rating
//            case openEnded
//        }
//    }
//
//    struct Activity {
//        var activityId: Int
//        var activityType: ActivityType
//        var date: Date
//        var duration: Int
//
//        enum ActivityType: String {
//            case surveyCompletion
//            case gameCompletion
//            case exercise
//            case therapySession
//            case other
//        }
//    }
//
//    mutating func addActivity(_ activity: Activity) {
//        self.recentActivities.append(activity)
//    }
//}
//
//// MARK: - Explorer Model
//struct Explorer {
//    var availableGames: [Game]
//
//    // Fetch games recommended by a hint or algorithm
//    func getRecommendedGames(forUserProfile profile: UserProfile) -> [Game] {
//        // Example: Filter games based on preferred categories
//        return availableGames.filter { game in
//            profile.preferredGameCategories.contains { category in
//                game.categories.contains(category)
//            }
//        }
//    }
//
//    // Fetch games by category
//    func getGamesByCategory(category: String) -> [Game] {
//        return availableGames.filter { $0.categories.contains(category) }
//    }
//
//    // Fetch games differentiated by approved or parental control filters
//    func getFilteredGames(isApproved: Bool? = nil, isParental: Bool? = nil) -> [Game] {
////        return availableGames.filter { game in
////            (isApproved == nil || game.isApproved == isApproved!) &&
////            (isParental == nil || game.isParental == isParental!)
////        }
//    }
//}
//
//// MARK: - Child Model
//struct Child {
//    var id: Int
//    var name: String
//    var age: Int
//    var gender: Gender
//    var diagnosisDate: Date?
//    var autismSeverity: AutismSeverity
//    var strengths: [String]
//    var areasOfSupport: [String]
//    var favoriteActivities: [String]
//    var sensoryNeeds: [String]
//    var medicalHistory: [MedicalCondition]
//    var screenTimeLimit: Int?
//
//    struct MedicalCondition {
//        var name: String
//        var diagnosedDate: Date?
//        var severity: String
//        var treatment: String?
//    }
//
//    enum Gender: String {
//        case male
//        case female
//        case other
//    }
//
//    enum AutismSeverity: String {
//        case mild
//        case moderate
//        case severe
//    }
//}
//// MARK: - Game Model
//struct Game {
//    var id: Int
//    var image: String
//    var name: String
//    var description: String
//    var instructions: String
//    var ageGroup: [Int]  // E.g., [3, 5] means suitable for kids aged 3 to 5
//    var categories: [String]  // E.g., ["Sensory", "Cognitive", "Motor"]
//    var gameDuration: Int  // Duration in minutes
//    var difficultyLevel: DifficultyLevel
//    var isFavourite: Bool  // Flag to mark as favorite
//    var datePlayed: Date?  // Tracks the date when the game was last played
//    var gameType: GameType
//    enum GameType{
//        case parental, appBased
//    }
//    // MARK: - DifficultyLevel Enum
//    enum DifficultyLevel: String {
//        case easy
//        case medium
//        case hard
//    }
//    // MARK: - GameState Enum
//    enum GameState: String {
//        case notStarted
//        case inProgress
//        case completed
//        case paused
//    }
//    var gameState: GameState  // Track the game's state
//}
//
//// MARK: - Parental Dashboard
//struct ParentalDashboard {
//    var userProfile: UserProfile
//    // Get scores for daily or weekly
//    func getScores(forTimeframe timeframe: Timeframe) -> [String: Int] {
//        // Example implementation: Mocked data based on timeframe
//        switch timeframe {
//        case .daily:
//            return ["Games Completed": 3, "Therapy Sessions": 1]
//        case .weekly:
//            return ["Games Completed": 20, "Therapy Sessions": 5]
//        }
//    }
//
//    // Limit screen time for child
//    mutating func setScreenTimeLimit(hours: Int, minutes: Int) {
//        // Example: Store screen time limit in the UserProfile or relevant storage
//        userProfile.child.screenTimeLimit = (hours * 60) + minutes
//    }
//
//    // Get and edit child's schedule
//    func getSchedule(forDate date: Date) -> UserProfile.Schedule? {
//        return userProfile.getSchedule(forDate: date)
//    }
//
//    mutating func editSchedule(forDate date: Date, newSchedule: UserProfile.Schedule) {
//        if let index = userProfile.schedule.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: date) }) {
//            userProfile.schedule[index] = newSchedule
//        }
//    }
//
//    // Get recently played games for today
//    func getPlayedGames(forDate date: Date) -> [Game] {
//        return userProfile.playedGames.filter { Calendar.current.isDate($0.datePlayed ?? <#default value#>, inSameDayAs: date) }
//    }
//
//    // Get resources (contact doctors and display data)
//    func getResources() -> [Resource] {
//        return [
//            Resource(type: .doctor, details: "Dr. Smith - Autism Specialist"),
//            Resource(type: .community, details: "Local Autism Support Group")
//        ]
//    }
//
//    enum Timeframe {
//        case daily
//        case weekly
//    }
//
//    struct Resource {
//        var type: ResourceType
//        var details: String
//
//        enum ResourceType {
//            case doctor
//            case community
//            case other
//        }
//    }
//}
