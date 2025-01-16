//
//  AlertViewController.swift
//  AppGlint_Zenith
//
//  Created by Devanshu Singh(chitkara)     on 11/12/24.
//

import UIKit

class AlertViewController: UIViewController {
    @IBOutlet weak var TitleText: UITextView!
    @IBOutlet weak var bodyText: UITextView!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var bodyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.layer.cornerRadius = 10.0 // Adjust the radius as needed
        myView.layer.masksToBounds = true
        
        
        bodyView.frame = CGRect(x: 0, y: bodyView.frame.height - 0, width: bodyView.frame.width, height: 1)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func DenyButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func AcceptButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Survey", bundle: nil)
        let surveyVC = storyboard.instantiateViewController(withIdentifier: "Survey") as! SurveyViewController
        surveyVC.modalPresentationStyle = .currentContext
//        performSegue(withIdentifier: "Survey", sender: self)
        present(surveyVC.self , animated: true)
        
            }
//        print("I am here ")
//        let storyboard = UIStoryboard(name: "Home", bundle: .main)
//        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! UINavigationController
//        self.present(homeViewController, animated: true)
        
//        self.navigationController?.pushViewController(homeViewController, animated: true)
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
