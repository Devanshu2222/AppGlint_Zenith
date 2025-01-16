////
////  ParentalData.swift
////  AppGlint_Zenith
////
////  Created by Devanshu Singh(chitkara)     on 18/12/24.
////
//
//import Foundation
//
//// MARK: - ChildData Model with Singleton

import Foundation
import UIKit

struct DashboardItem {
    let title: String
    let subtitle: String?
    let progress: Float?
    let color: UIColor?
    
    init(title: String, subtitle: String? = nil, progress: Float? = nil, color: UIColor? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.progress = progress
        self.color = color
    }
    
    
    struct ProgressData {
        let sensory: Double
        let calming: Double
        let interactive: Double
    }
    struct ParentalDashboard {
        var userProfileId: Int
        //    var dailyScreenTimeLimit: TimeInterval?
        //    var weeklyScreenTimeLimit: TimeInterval
        var currentDailyUsage: TimeInterval?
        var currentWeeklyUsage: TimeInterval?
        var dailyProgress: [DailyProgress]?
        var weeklyProgress: [WeeklyProgress]?
        var monthlyProgress: [MonthlyProgress]?
        var dailyScheduleId: Int?
        
        //    enum Timeframe {
        //        case daily
        //        case weekly
        //    }
    }
    
    
    struct DailyProgress {
        var date: Date
        var studyTime: TimeInterval
        var playtime: TimeInterval
        var otherTime: TimeInterval
    }
    struct WeeklyProgress {
        var weekStartDate: Date
        var totalStudyTime: TimeInterval
        var totalPlaytime: TimeInterval
        var totalOtherTime: TimeInterval
    }
    struct MonthlyProgress {
        var monthStartDate: Date
        var totalStudyTime: TimeInterval
        var totalPlaytime: TimeInterval
        var totalOtherTime: TimeInterval
    }
    
    
    //struct ScheduledActivity {
    //    var activityName: String
    //    var startTime: Date
    //    var endTime: Date
    //    func duration() -> TimeInterval {
    //        return endTime.timeIntervalSince(startTime)
    class ChildDataModel {
        // Singleton instance
        private var users: [User] = []
        static let shared = ChildDataModel()
        
        // Private initializer to prevent direct instantiation
        private init() {}
    }
    
    
    
    //    func getScores(forTimeframe timeframe: Timeframe) -> [String: Int] {
    //        switch timeframe {
    //        case .daily:
    //            return ["Games Completed": 3, "Therapy Sessions": 1]
    //        case .weekly:
    //            return ["Games Completed": 20, "Therapy Sessions": 5]
    //        }
    //    }
    //
    //    mutating func setScreenTimeLimit(hours: Int, minutes: Int) {
    //        userProfile.user.screenTimeLimit = (hours * 60) + minutes
    //    }
    //
    //    func getSchedule(forDate date: Date) -> Schedule? {
    //        return userProfile.getSchedule(forDate: date)
    //    }
    //
    //    mutating func editSchedule(forDate date: Date, newSchedule: Schedule) {
    //        if let index = userProfile.schedule.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: date) }) {
    //            userProfile.schedule[index] = newSchedule
    //        }
    //    }
    //
    //    func getResources() -> [Resource] {
    //        return [
    //            Resource(type: .doctor, details: "Dr. Smith - Autism Specialist"),
    //            Resource(type: .community, details: "Local Autism Support Group")
    //        ]
    //    }
    //}
    //struct ChildData {
    ////    var name: String
    ////    var age: Int
    //
    //
    ////    mutating func addDailyProgress(date: Date, studyTime: TimeInterval, playtime: TimeInterval, otherTime: TimeInterval) {
    ////            // Check if progress for the given date already exists
    ////
    ////        }
    ////    mutating func addWeeklyProgress(weekStartDate: Date, studyTime: TimeInterval, playtime: TimeInterval, otherTime: TimeInterval) {
    ////        if let index = weeklyProgress.firstIndex(of: weekStartDate) {
    ////            weeklyProgress[index].totalStudyTime += studyTime
    ////        }
    //
    //    }
    //}
    //    // MARK: - Private Data Members
    //    private var childData = ChildData(
    ////        name: "Default Child",
    ////        age: 10,
    //        dailyScreenTimeLimit: 2 * 3600,
    //        weeklyScreenTimeLimit: 14 * 3600,
    //        currentDailyUsage: 0,
    //        currentWeeklyUsage: 0,
    //        dailyProgress: [],
    //        weeklyProgress: [],
    //        monthlyProgress: [],
    //        dailySchedule: []
    //    )
    //
    //    // MARK: - Public Methods
    //
    //    func getUserData(by id: Int) -> User? {
    //            return users.first { $0.id == id }
    //        }
    //    func updateDailyUsage(timeSpent: TimeInterval) {
    //        ParentalDashboard.currentDailyUsage += timeSpent
    //    }
    //
    //    func updateWeeklyUsage(timeSpent: TimeInterval) {
    //        ParentalDashboard.currentWeeklyUsage += timeSpent
    //    }
    //
    //    func addDailyProgress(date: Date, studyTime: TimeInterval, playtime: TimeInterval, otherTime: TimeInterval) {
    //        if let index = dailyProgress.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: date) }) {
    //            // Update existing entry
    //            dailyProgress[index].studyTime += studyTime
    //            dailyProgress[index].playtime += playtime
    //            dailyProgress[index].otherTime += otherTime
    //        } else {
    //            // Add new entry
    //            let newProgress = DailyProgress(date: date, studyTime: studyTime, playtime: playtime, otherTime: otherTime)
    //            dailyProgress.append(newProgress)
    //        }
    //    }
    //
    //    func addWeeklyProgress(startDate: Date, totalStudyTime: TimeInterval, totalPlaytime: TimeInterval, totalOtherTime: TimeInterval) {
    //        childData.addWeeklyProgress(startDate: startDate, totalStudyTime: totalStudyTime, totalPlaytime: totalPlaytime, totalOtherTime: totalOtherTime)
    //    }
    //
    //    func addMonthlyProgress(month: Date, totalStudyTime: TimeInterval, totalPlaytime: TimeInterval, totalOtherTime: TimeInterval) {
    //        childData.addMonthlyProgress(month: month, totalStudyTime: totalStudyTime, totalPlaytime: totalPlaytime, totalOtherTime: totalOtherTime)
    //    }
    //
    //    func addScheduledActivity(activityName: String, startTime: Date, endTime: Date) {
    //        childData.addScheduledActivity(activityName: activityName, startTime: startTime, endTime: endTime)
    //    }
    //
    //    func removeScheduledActivity(at index: Int) {
    //        childData.ScheduledActivity
    //    }
    //
    ////     create a closer to remove the scheduled activity
    //
    //
    //
    //
    //    func updateScheduledActivity(at index: Int, with newActivity: ScheduledActivity) {
    //        childData.updateScheduledActivity(at: index, with: newActivity)
    //    }
    //
    //    func getTotalStudyTimeForCurrentWeek() -> TimeInterval {
    //        return childData.getTotalStudyTimeForCurrentWeek()
    //    }
    //}
    //
    //// MARK: - ChildData Struct
    ////struct ChildData {
    ////    var name: String
    ////    var age: Int
    ////    var dailyScreenTimeLimit: TimeInterval
    ////    var weeklyScreenTimeLimit: TimeInterval
    ////    var currentDailyUsage: TimeInterval
    ////    var currentWeeklyUsage: TimeInterval
    ////    var dailyProgress: [DailyProgress]
    ////    var weeklyProgress: [WeeklyProgress]
    ////    var monthlyProgress: [MonthlyProgress]
    ////    var dailySchedule: [ScheduledActivity]
    ////
    ////    // MARK: - Methods for Updating Data
    ////
    ////    mutating func updateDailyUsage(timeSpent: TimeInterval) {
    ////        currentDailyUsage += timeSpent
    ////    }
    ////
    ////    mutating func updateWeeklyUsage(timeSpent: TimeInterval) {
    ////        currentWeeklyUsage += timeSpent
    ////    }
    ////
    ////    mutating func addDailyProgress(date: Date, studyTime: TimeInterval, playtime: TimeInterval, otherTime: TimeInterval) {
    ////        let newProgress = DailyProgress(date: date, studyTime: studyTime, playtime: playtime, otherTime: otherTime)
    ////        dailyProgress.append(newProgress)
    ////    }
    ////
    ////    mutating func addWeeklyProgress(startDate: Date, totalStudyTime: TimeInterval, totalPlaytime: TimeInterval, totalOtherTime: TimeInterval) {
    ////        let newProgress = WeeklyProgress(weekStartDate: startDate, totalStudyTime: totalStudyTime, totalPlaytime: totalPlaytime, totalOtherTime: totalOtherTime)
    ////        weeklyProgress.append(newProgress)
    ////    }
    ////
    ////    mutating func addMonthlyProgress(month: Date, totalStudyTime: TimeInterval, totalPlaytime: TimeInterval, totalOtherTime: TimeInterval) {
    ////        let newProgress = MonthlyProgress(month: month, totalStudyTime: totalStudyTime, totalPlaytime: totalPlaytime, totalOtherTime: totalOtherTime)
    ////        monthlyProgress.append(newProgress)
    ////    }
    ////
    ////    mutating func addScheduledActivity(activityName: String, startTime: Date, endTime: Date) {
    ////        let newActivity = ScheduledActivity(activityName: activityName, startTime: startTime, endTime: endTime)
    ////        dailySchedule.append(newActivity)
    ////    }
    ////
    ////    mutating func removeScheduledActivity(at index: Int) {
    ////        if index >= 0 && index < dailySchedule.count {
    ////            dailySchedule.remove(at: index)
    ////        }
    ////    }
    ////
    ////    mutating func updateScheduledActivity(at index: Int, with newActivity: ScheduledActivity) {
    ////        if index >= 0 && index < dailySchedule.count {
    ////            dailySchedule[index] = newActivity
    ////        }
    ////    }
    ////
    ////    func getTotalStudyTimeForCurrentWeek() -> TimeInterval {
    ////        let calendar = Calendar.current
    ////        let today = Date()
    ////        let startOfWeek = calendar.startOfDay(for: calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))!)
    ////        let endOfWeek = calendar.date(byAdding: .day, value: 6, to: startOfWeek)!
    ////
    ////        let currentWeekProgress = weeklyProgress.filter { progress in
    ////            progress.weekStartDate >= startOfWeek && progress.weekStartDate <= endOfWeek
    ////        }
    ////
    ////        return currentWeekProgress.reduce(0) { $0 + $1.totalStudyTime }
    ////    }
    ////}
}
