//
//  LoginScreenViewController.swift
//  AppGlint_Zenith
//
//  Created by Devanshu Singh(chitkara)     on 04/12/24.
//

import UIKit

class LoginScreenViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //myView
        //let myView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
               myView.backgroundColor = .white

               // Add an outline
               myView.layer.borderWidth = 2.0
               myView.layer.borderColor = UIColor.black.cgColor

               // Add rounded corners and shadow
               myView.layer.cornerRadius = 10.0
               myView.layer.shadowColor = UIColor.gray.cgColor
               myView.layer.shadowOpacity = 0.5
               myView.layer.shadowOffset = CGSize(width: 2, height: 2)

               // Add the view to the view controller's view
            //view.addSubview(myView)
        // Do any additional setup after loading the view.
    
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func LoginButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let HomeTBC = storyboard.instantiateViewController(withIdentifier: "tabBarVC") as! UITabBarController
        HomeTBC.modalPresentationStyle = .fullScreen
//        performSegue(withIdentifier: "Survey", sender: self)
        present(HomeTBC.self , animated: true)
    }
    
    
}
