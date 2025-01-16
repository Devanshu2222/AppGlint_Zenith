//
//  UserDetails.swift
//  AppGlint_Zenith
//
//  Created by sharanjit Kaur on 19/12/24.
//

import Foundation

struct User {
    var id: Int
    var name: String
    var email: String?
    var phone: String?
    var dateOfBirth: Date?
    var profilePictureURL: String?
    var autismCategory: [String]? //use enum
    var favoriteGamesId: [Int]?
    var todayScheduleId: Int?  //home page schdule 
    var screenTimeLimit: Int? // Screen time limit in minutes

    // Computed property to dynamically calculate age from date of birth
    var age: Int? {
        guard let dob = dateOfBirth else { return nil }
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: dob, to: Date())
        return ageComponents.year
    }
}

let FirstUser = User(id: 20, name: "Devanshu", email: "devanshu@gmail.com", phone: "9876543210", dateOfBirth: Date(), profilePictureURL: "", autismCategory: [], favoriteGamesId: [], todayScheduleId: 0, screenTimeLimit: 0)


class UserDetailsDataModel {
    private var users:[User] = []
    static let shared = UserDetailsDataModel()
    private init(){
        users.append(FirstUser)
    }

    func addUser(user: User){
        users.append(user)
    }
    func getUserDetails(by id: Int) -> User? {
        return users.first { $0.id == id }
    }
    func updateAutismCategory(newCategory: [String] , userId: Int) {
        if let index = users.firstIndex(where: { $0.id == userId }) {
            users[index].autismCategory = newCategory
        }
    }
    func updateFavouriteGames(newFavoriteGames: [Int] , userId: Int) {
        if let IndexPath = users.firstIndex(where: { $0.id == userId }) {
            users[IndexPath].favoriteGamesId = newFavoriteGames
        }
    }
    
    

    //addUser func to add new user while signup
    // get specifioc user by id
    //updateUserDetails // changes
    //  // filter based on id
    
    
}

