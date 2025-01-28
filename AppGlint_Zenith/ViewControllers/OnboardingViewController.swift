//
//  onboardingViewController.swift
//  AppGlint_Zenith
//
//  Created by Devanshu Singh(chitkara)     on 04/12/24.
//

import UIKit

class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
    }
    @IBAction func SkipButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let HomeTBC = storyboard.instantiateViewController(withIdentifier: "tabBarVC") as! UITabBarController
        HomeTBC.modalPresentationStyle = .fullScreen
//        performSegue(withIdentifier: "Survey", sender: self)
        present(HomeTBC.self , animated: true)
//
//        

    }
   
}
