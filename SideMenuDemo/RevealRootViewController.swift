//
//  RevealRootViewController.swift
//  SideMenuDemo
//
//  Created by Ahmed Elzohry on 1/29/19.
//  Copyright © 2019 Ahmed Elzohry. All rights reserved.
//

import UIKit
import MOLH

class RevealRootViewController: SWRevealViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let frontViewController = mainStoryboard.instantiateViewController(withIdentifier: "Home")
        let navController = UINavigationController(rootViewController: frontViewController)
        setFront(navController, animated: false)
        
        let menuViewController = mainStoryboard.instantiateViewController(withIdentifier: "SideMenu")
        
        if MOLHLanguage.currentAppleLanguage() == "ar" {
            setRight(menuViewController, animated: false)
        }else {
            setRear(menuViewController, animated: false)
        }

        // to enable/disable pan gesture
        panGestureRecognizer()?.isEnabled = true
    }

}
