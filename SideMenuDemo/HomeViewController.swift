//
//  HomeViewController.swift
//  SideMenuDemo
//
//  Created by Ahmed Elzohry on 1/29/19.
//  Copyright © 2019 Ahmed Elzohry. All rights reserved.
//

import UIKit
import MOLH

class HomeViewController: UIViewController, MOLHLocalizable {
    
    @IBOutlet weak var homeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myNavButton = UIBarButtonItem(title: NSLocalizedString("menu", comment: ""), style: .plain, target: self, action: #selector(toggleMenu))
        navigationItem.leftBarButtonItem = myNavButton
        
        self.revealViewController().tapGestureRecognizer()
        self.revealViewController().panGestureRecognizer()
    }
    
    func localize() {
        homeLabel.text = NSLocalizedString("home", comment: "")
    }
    
    @objc private func toggleMenu() {
        
        if MOLHLanguage.currentAppleLanguage() == "ar" {
            revealViewController()?.rightRevealToggle(animated: true)
        } else {
           revealViewController()?.revealToggle(animated: true)
        }
        
    }
    
    
    @IBAction func changeLanguage(_ sender: Any) {
        
        let alert = UIAlertController(title: "Change Language", message: "language will be change", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action : UIAlertAction) in
            MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
            MOLH.reset()
            
            print ("the language Must change now ")
        }
        let cancel = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert,animated: true,completion: nil)
        
    }
    

}

