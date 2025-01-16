//
//  CreateAccountViewController.swift
//  AppGlint_Zenith
//
//  Created by Devanshu Singh(chitkara)     on 10/12/24.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var CreateView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        CreateView.backgroundColor = .white

        // Add an outline
        CreateView.layer.borderWidth = 1.5
        CreateView.layer.borderColor = UIColor.black.cgColor

        // Add rounded corners and shadow
        CreateView.layer.cornerRadius = 10.0
        CreateView.layer.shadowColor = UIColor.gray.cgColor
        CreateView.layer.shadowOpacity = 0.5
        CreateView.layer.shadowOffset = CGSize(width: 2, height: 2.5)

        // Do any additional setup after loading the view.
    }
    let alertservice = AlertService()
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let alertVC = alertservice.alert()
        present(alertVC,animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
