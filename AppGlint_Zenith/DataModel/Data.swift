//import Foundation
//// MARK: - User Model
//
//struct User {
//    var id: Int
//    var name: String
//    var email: String
//    var phone: String
//    var address: String
//    var dateOfBirth: Date?
//    var profilePictureURL: String?
//    var child: Child  // Associated child details
//    var userSettings: UserSettings  // User-specific settings
//    
//    // MARK: - UserSettings Model
//    struct UserSettings {
//        var notificationsEnabled: Bool
//        var privacyLevel: PrivacyLevel
//        var preferredNotificationTime: Date?
//        
//        enum PrivacyLevel: String {
//            case low
//            case medium
//            case high
//        }
//    }
//}
//
//// MARK: - Child Model (Child with Autism)
//struct Child {
//    var id: Int
//    var name: String
//    var age: Int
//    var gender: Gender
//    var diagnosisDate: Date?
//    var autismSeverity: AutismSeverity
//    var strengths: [String]  // E.g., "Strong in visual learning"
//    var areasOfSupport: [String]  // E.g., "Needs help with communication"
//    var favoriteActivities: [String]  // E.g., "Likes puzzles"
//    var sensoryNeeds: [String]  // E.g., "Sensitive to bright lights"
//    var medicalHistory: [MedicalCondition]  // List of medical conditions
//    
//    // MARK: - MedicalCondition Model
//    struct MedicalCondition {
//        var name: String
//        var diagnosedDate: Date?
//        var severity: String  // E.g., "Mild", "Moderate", "Severe"
//        var treatment: String?  // E.g., "Medication", "Therapy"
//    }
//
//    // MARK: - Gender Enum
//    enum Gender: String {
//        case male
//        case female
//        case other
//    }
//    
//    // MARK: - AutismSeverity Enum
//    enum AutismSeverity: String {
//        case mild
//        case moderate
//        case severe
//    }
//}
//
//// MARK: - Survey Model
//struct Survey {
//    var id: Int
//    var title: String
//    var description: String
//    var questions: [SurveyQuestion]
//    var surveyDate: Date
//    var completionStatus: SurveyCompletionStatus
//    
//    // MARK: - SurveyCompletionStatus Enum
//    enum SurveyCompletionStatus: String {
//        case notStarted
//        case inProgress
//        case completed
//        case archived
//    }
//}
//
//// MARK: - Survey Question Model
//struct SurveyQuestion {
//    var id: Int
//    var questionText: String
//    var type: QuestionType
//    var options: [String]?
//    var isMandatory: Bool  // Whether the question is required to be answered
//    
//    // MARK: - QuestionType Enum
//    enum QuestionType: String {
//        case multipleChoice
//        case trueFalse
//        case rating
//        case openEnded
//    }
//}
//
//// MARK: - Survey Answer Model
//struct SurveyAnswer {
//    var id: Int
//    var questionId: Int
//    var answerText: String?
//    var selectedOption: String?
//    var rating: Int?
//    var isTrue: Bool?  // Used for True/False questions
//    var answerDate: Date?
//    var isCorrect:Int?  
//    var isVerified: Bool  // Indicates whether the answer has been verified by a professional
//    
//    // MARK: - VerificationStatus Enum
//    enum VerificationStatus: String {
//        case pending
//        case verified
//        case rejected
//    }
//}
//
//// MARK: - Game Model
//struct Game {
//    var id: Int
//    var name: String
//    var description: String
//    var instructions: String
//    var ageGroup: [Int]  // E.g., [3, 5] could mean the game is suitable for kids aged 3 to 5.
//    var categories: [String]  // E.g., ["Sensory", "Cognitive", "Motor"]
//    var gameDuration: Int  // Duration in minutes
//    var difficultyLevel: DifficultyLevel
//    var isFavourite: Bool  // Flag for favorite games
//    
//    // MARK: - DifficultyLevel Enum
//    enum DifficultyLevel: String {
//        case easy
//        case medium
//        case hard
//    }
//    
//    // MARK: - GameState Enum
//    enum GameState: String {
//        case notStarted
//        case inProgress
//        case completed
//        case paused
//    }
//    
//    var gameState: GameState  // Track the game state (e.g., whether the user has started, paused, or completed the game)
//}
//
//// MARK: - UserProfile Model
//struct UserProfile {
//    var id: Int
//    var user: User
//    var child: Child
//    var completedSurveys: [Survey]
//    var playedGames: [Game]
//    var preferredGameCategories: [String]  // List of categories the user is interested in
//    var recentActivities: [Activity]  // List of recent activities completed by the user/child
//    
//    // MARK: - Activity Model
//    struct Activity {
//        var activityId: Int
//        var activityType: ActivityType
//        var date: Date
//        var duration: Int  // Duration in minutes
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
//    // Method to add a completed activity
//    mutating func addActivity(_ activity: Activity) {
//        self.recentActivities.append(activity)
//    }
//}
//
//// MARK: - ChildProgress Model (Tracking progress over time)
//struct ChildProgress {
//    var childId: Int
//    var progressDate: Date
//    var progressDetails: [ProgressDetail]
//    
//    struct ProgressDetail {
//        var area: String  // E.g., "Social skills", "Communication", "Motor skills"
//        var progressRating: Int  // Rating scale: 1 to 10
//        var notes: String?
//    }
//    
//    // Method to update progress details
//    mutating func updateProgress(_ newProgress: ProgressDetail) {
//        self.progressDetails.append(newProgress)
//    }
//}
//
//// MARK: - ActivityLog Model (Track Activity History)
//struct ActivityLog {
//    var childId: Int
//    var activityId: Int
//    var activityType: ActivityType
//    var date: Date
//    var description: String
//    
//    // MARK: - ActivityType Enum
//    enum ActivityType: String {
//        case therapySession
//        case game
//        case survey
//        case specialEvent
//        case other
//    }
//}
//
//// MARK: - Notifications Model (Track Notifications sent to users)
//struct Notification {
//    var id: Int
//    var title: String
//    var message: String
//    var recipientUserId: Int
//    var notificationDate: Date
//    var notificationType: NotificationType
//    var isRead: Bool
//    
//    // MARK: - NotificationType Enum
//    enum NotificationType: String {
//        case surveyReminder
//        case gameRecommendation
//        case progressUpdate
//        case systemAlert
//        case other
//    }
//}
//
//// MARK: - Survey Answers
//
////let surveyAnswers: [SurveyAnswer] = [
////    SurveyAnswer(id: 1, questionId: 1, answerText: "5", isVerified: true),
////    SurveyAnswer(id: 2, questionId: 2, answerText: "Around 2 years old", isVerified: true),
////    SurveyAnswer(id: 3, questionId: 3, isTrue: true, isVerified: false),
////    SurveyAnswer(id: 4, questionId: 4, isTrue: false, isVerified: true),
////    SurveyAnswer(id: 5, questionId: 5, isTrue: true, isVerified: false),
////    SurveyAnswer(id: 6, questionId: 6, isTrue: true, isVerified: true),
////    SurveyAnswer(id: 7, questionId: 7, isTrue: false, isVerified: true),
////    SurveyAnswer(id: 8, questionId: 8, isTrue: true, isVerified: true),
////    SurveyAnswer(id: 9, questionId: 9, selectedOption: "Average", isVerified: false),
////    SurveyAnswer(id: 10, questionId: 10, selectedOption: "Fair", isVerified: true),
////    SurveyAnswer(id: 11, questionId: 11, selectedOption: "Good", isVerified: false),
////    SurveyAnswer(id: 12, questionId: 12, answerText: "Loud noises, sudden changes in routine", isVerified: true),
////    SurveyAnswer(id: 13, questionId: 13, answerText: "Positive reinforcement, visual schedules, and sensory breaks", isVerified: false),
////    SurveyAnswer(id: 14, questionId: 14, isTrue: true, isVerified: true),
////    SurveyAnswer(id: 15, questionId: 15, answerText: "Speech therapy and occupational therapy", isVerified: false),
////    SurveyAnswer(id: 16, questionId: 16, answerText: "Art and puzzles", isVerified: true),
////    SurveyAnswer(id: 17, questionId: 17, answerText: "Social interactions and meltdowns", isVerified: true),
////    SurveyAnswer(id: 18, questionId: 18, answerText: "More accessible community resources and increased awareness", isVerified: false),
////    SurveyAnswer(id: 19, questionId: 19, answerText: "It's challenging but rewarding.", isVerified: true),
////    SurveyAnswer(id: 20, questionId: 20, isTrue: true, isVerified: false)
////]
//
//// MARK: - Additional Functions
//// 2. Verify Survey Answer
//func verifyAnswer(answerId: Int, answers: inout [SurveyAnswer]) {
//    if let index = answers.firstIndex(where: { $0.id == answerId }) {
//        answers[index].isVerified = true
//    }
//}
//
//// 4. Get Survey Answers for a Specific Question
//func getAnswersForQuestion(questionId: Int, answers: [SurveyAnswer]) -> [SurveyAnswer] {
//    return answers.filter { $0.questionId == questionId }
//}
//
//// 5. Get User's Completed Surveys
//func getCompletedSurveys(forUser userId: Int, surveys: [Survey], userAnswers: [SurveyAnswer]) -> [Survey] {
//    let completedSurveyIds = userAnswers.filter { $0.isVerified }.map { $0.questionId }
//    return surveys.filter { completedSurveyIds.contains($0.id) }
//}
//
//// 6. Get Child's Progress for a Specific Area
//func getProgress(forChild childId: Int, area: String, progressLogs: [ChildProgress]) -> [ChildProgress.ProgressDetail]? {
//    return progressLogs
//        .filter { $0.childId == childId }
//        .flatMap { $0.progressDetails }
//        .filter { $0.area == area }
//}
//
//// 7. Add a New Activity
//func addActivity(toUserProfile profile: inout UserProfile, activity: UserProfile.Activity) {
//    profile.recentActivities.append(activity)
//}
//
//// 8. Track Game Progress
//func updateGameState(gameId: Int, newState: Game.GameState, games: inout [Game]) {
//    if let index = games.firstIndex(where: { $0.id == gameId }) {
//        games[index].gameState = newState
//    }
//}
//
//// 9. Get Notification for User
//func getNotifications(forUser userId: Int, notifications: [Notification]) -> [Notification] {
//    return notifications.filter { $0.recipientUserId == userId }
//}
//
//// 10. Send Notification
//func sendNotification(title: String, message: String, userId: Int, notificationType: Notification.NotificationType, notifications: inout [Notification]) {
//    let newNotification = Notification(
//        id: notifications.count + 1,  // Generate new ID for simplicity
//        title: title,
//        message: message,
//        recipientUserId: userId,
//        notificationDate: Date(),
//        notificationType: notificationType,
//        isRead: false
//    )
//    notifications.append(newNotification)
//}
//
//// 11. Get Child's Medical History
//func getMedicalHistory(forChild childId: Int, children: [Child]) -> [Child.MedicalCondition]? {
//    return children.first(where: { $0.id == childId })?.medicalHistory
//}
//
//// 12. Get All Answers for a Survey Question
//func getAllAnswersForQuestion(questionId: Int, answers: [SurveyAnswer]) -> [String] {
//    return answers
//        .filter { $0.questionId == questionId }
//        .compactMap { $0.answerText ?? $0.selectedOption ?? String($0.rating ?? 0) }
//}
//
//// 13. Get User Profile
//func getUserProfile(forUserId userId: Int, profiles: [UserProfile]) -> UserProfile? {
//    return profiles.first { $0.user.id == userId }
//}
//
//// 14. Filter Surveys by Completion Status
//func filterSurveysByStatus(status: Survey.SurveyCompletionStatus, surveys: [Survey]) -> [Survey] {
//    return surveys.filter { $0.completionStatus == status }
//}
//
//// 15. Get All Games for a Specific Age Group
//func getGames(forAgeGroup ageGroup: [Int], games: [Game]) -> [Game] {
//    return games.filter { game in
//        !game.ageGroup.isEmpty && ageGroup.contains { game.ageGroup.contains($0) }
//    }
//}
//
//// 16. Update Survey Completion Status
//func updateSurveyCompletionStatus(surveyId: Int, newStatus: Survey.SurveyCompletionStatus, surveys: inout [Survey]) {
//    if let index = surveys.firstIndex(where: { $0.id == surveyId }) {
//        surveys[index].completionStatus = newStatus
//    }
//}
//// MARK: - Methods to get schedule, recently played games, and favorite games
//func getSchedule(forDate date: Date) -> Schedule? {
//    // Here, you would typically retrieve the schedule from a database or API based on the date.
//    return userProfile.schedule.first(where: { Calendar.current.isDate($0.date, inSameDayAs: date) })
//}
//
//func getRecentlyPlayedGames() -> [Game] {
//    // Get recently played games from the user's profile.
//    return userProfile.playedGames.filter { game in
//        game.gameState == .completed
//    }
//}
//
//func getFavoriteGames() -> [Game] {
//    // Get the favorite games from the user's profile (assuming isFavorite flag).
//    return userProfile.playedGames.filter { game in
//        game.isFavourite
//    }
//}
//// Example usage:
////var surveys: [Survey] = [/* survey data */]
////var answers: [SurveyAnswer] = [/* answers data */]
////var userProfile = UserProfile(id: 1, user: User(id: 1, name: "John Doe", email: "john@example.com", phone: "1234567890", address: "123 Main St", dateOfBirth: nil, profilePictureURL: nil, child: Child(id: 1, name: "Alex", age: 5, gender: .male, autismSeverity: .moderate, strengths: ["Visual learning"], areasOfSupport: ["Speech delay"], favoriteActivities: ["Puzzles"], sensoryNeeds: ["Bright lights"], medicalHistory: []), userSettings: User.UserSettings(notificationsEnabled: true, privacyLevel: .medium, preferredNotificationTime: nil)), child: Child(id: 1, name: "Alex", age: 5, gender: .male, autismSeverity: .moderate, strengths: ["Visual learning"], areasOfSupport: ["Speech delay"], favoriteActivities: ["Puzzles"], sensoryNeeds: ["Bright lights"], medicalHistory: []), completedSurveys: [], playedGames: [], preferredGameCategories: ["Cognitive"], recentActivities: [])]
//
//// Add a new activity
////let activity = UserProfile.Activity(activityId: 1, activityType: .surveyCompletion, date: Date(), duration: 30)
////addActivity(toUserProfile: &userProfile, activity: activity)
