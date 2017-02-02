//
//  HomeController.swift
//  Greenify
//
//  Created by Carbone Rosario on 31/01/2017.
//  Copyright © 2017 Carbone Rosario. All rights reserved.
//

import UIKit


class HomeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "We're logged in"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(handleSignOut))
        
        let imageView = UIImageView(image: UIImage(named: "home"))
        view.addSubview(imageView)
        _ = imageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        
        
    }
    
    func handleSignOut() {
        UserDefaults.standard.setIsLoggedIn(value: false)
        
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }

}
