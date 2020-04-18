//
//  ViewController.swift
//  HelloFBAuth0418
//
//  Created by 申潤五 on 2020/4/18.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit
import Firebase
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
        
        if error == nil{
            if let token = AccessToken.current{
                let credential = FacebookAuthProvider.credential(withAccessToken: token.tokenString)
                Auth.auth().signIn(with: credential) { (result, error) in
                    if error == nil{
                        print("FB 整合成功")
                    }else{
                        print(error?.localizedDescription)
                    }
                }
            }
        }
        
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("FBLogout")
        do {
            try Auth.auth().signOut()
            print("登出成功")
        } catch  {
            print("登出失敗")
        }
        
        
    }

}

