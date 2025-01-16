//
//  AlertService.swift
//  AppGlint_Zenith
//
//  Created by Devanshu Singh(chitkara)     on 11/12/24.
//

import UIKit

class AlertService{
    func alert() -> AlertViewController{
        let StoryBoard = UIStoryboard(name: "Alert", bundle: .main)
        let alertVC = StoryBoard.instantiateViewController(identifier: "alertVC") as! AlertViewController
        
        return alertVC
    }
}
