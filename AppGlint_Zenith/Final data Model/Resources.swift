//
//  Resources.swift
//  AppGlint_Zenith
//
//  Created by student-2 on 18/12/24.
//
// MARK: - Article Struct
struct Article {
    let id: Int                // Unique identifier
    let title: String          // Article title
    let description: String    // Short description
    let imageURL: String       // Image URL for the article
    let category: Category     // Article category
    
    enum Category {
        case autism            // Articles related to autism
        case activities        // Activities for kids
        case parenting         // Parenting guidance
    }
}

// MARK: - ContactInfo Struct
struct ContactInfo {
    let id: Int               // Unique identifier
    let name: String           // Name of the center or doctor
    let type: ContactType      // Type: Doctor or Therapy Center
    let phoneNumber: String    // Contact number
    let address: String        // Address of the center
    let location: String       // City/Region
    
    enum ContactType {
        case doctor            // Doctor's contact information
        case therapyCenter     // Therapy center contact
    }
}

// MARK: - User Struct
struct User1 {
    let user: User
    let readArticles: [Int]    // List of read article IDs
}

class ResourceDataModel {
    
    
    // MARK: - Recommended Articles
    func recommendedArticles(articles: [Article], user: User1) -> Article? {
        let unreadArticles = articles.filter { !user.readArticles.contains($0.id) }
        return unreadArticles.first
    }
    
    // MARK: - Fetch Articles by Category
    func fetchArticles(articles: [Article], category: Article.Category) -> [Article] {
        return articles.filter { $0.category == category }
    }
    
    // MARK: - Fetch Therapy Centers
    func therapyCenters(contacts: [ContactInfo], location: String) -> [ContactInfo] {
        return contacts.filter { $0.type == .therapyCenter && $0.location == location }
    }
    
    // MARK: - Fetch Doctors
    func doctors(contacts: [ContactInfo], location: String) -> [ContactInfo] {
        return contacts.filter { $0.type == .doctor && $0.location == location }
    }
}








