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
        let vc = (UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController)
            self.navigationController?.pushViewController(vc, animated: true)
//        
//        

    }
   
}
