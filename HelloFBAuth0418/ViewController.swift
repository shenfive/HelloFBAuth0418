//
//  ViewController.swift
//  HelloFBAuth0418
//
//  Created by 申潤五 on 2020/4/18.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class ViewController: UIViewController,LoginButtonDelegate {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginButton = FBLoginButton()
        // Optional: Place the button in the center of your view.
        loginButton.center = view.center
        
        
//        loginButton.permissions = ["public_profile","email","user_friends"]
        loginButton.delegate = self
        
        
        
        view.addSubview(loginButton)
    }

    //MARK:FBLogin Delegate
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print("FBLogin")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("FBLogout")
    }

}

