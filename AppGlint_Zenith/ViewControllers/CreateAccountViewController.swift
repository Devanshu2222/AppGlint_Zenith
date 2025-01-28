//
//  CreateAccountViewController.swift
//  AppGlint_Zenith
//
//  Created by Devanshu Singh(chitkara)     on 10/12/24.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var childName: UITextField!
    
    @IBOutlet weak var childAgeDatePicker: UIDatePicker!
    
    @IBOutlet weak var parentEmail: UITextField!
    
    @IBOutlet weak var CreateView: UIView!
    
    
    let alertservice = AlertService()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Customizations for CreateView
        CreateView.backgroundColor = .white
        CreateView.layer.borderWidth = 1.5
        CreateView.layer.borderColor = UIColor.black.cgColor
        CreateView.layer.cornerRadius = 10.0
        CreateView.layer.shadowColor = UIColor.gray.cgColor
        CreateView.layer.shadowOpacity = 0.5
        CreateView.layer.shadowOffset = CGSize(width: 2, height: 2.5)

    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        // Safely unwrap text fields and date picker
        guard let name = childName.text, !name.isEmpty,
            let email = parentEmail.text, !email.isEmpty else {
            let alert = UIAlertController(title: "Error", message: "Please fill in all required fields.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
                return
            }
        
        let selectedAgeDate = childAgeDatePicker.date
                let age = calculateAge(from: selectedAgeDate)
                
                // Save user data
        UserDataManager.shared.saveUserData(childName: name, childAge: age, parentEmail: email, phone: "")
                
                // Print user data for debugging
                if let userData = UserDataManager.shared.getUserData() {
                    print("Child Name: \(userData.childName)")
                    print("Child Age: \(userData.childAge)")
                    print("Parent Email: \(userData.parentEmail)")
                }
                
                // Show success alert or go to next screen
                let alertVC = alertservice.alert()
                present(alertVC, animated: true)
            }
        
        
    
    func calculateAge(from dateOfBirth: Date) -> Int {
            let calendar = Calendar.current
            let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: Date())
            return ageComponents.year ?? 0
        }
    

}
