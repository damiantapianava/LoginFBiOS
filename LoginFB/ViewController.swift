//
//  ViewController.swift
//  LoginFB
//
//  Created by Infraestructura on 04/11/16.
//  Copyright © 2016 Infraestructura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let unRect = self.view.bounds
        
        if(FBSDKAccessToken.currentAccessToken() != nil)
        {
            //La app ya fue autorizada anteriormente
            let logout = UIButton(type:.Custom)
            logout.setTitle("Logout", forState: .Normal)
            logout.center = self.view.center
            logout.addTarget(self, action: #selector(ViewController.logout), forControlEvents: .TouchUpInside)
            
        } else {
        
            let login:FBSDKLoginButton = FBSDKLoginButton(frame: CGRectMake(unRect.width/3, unRect.size.height / 3, unRect.size.width / 3, unRect.size.height / 3))

        
            login.delegate = self
            login.readPermissions = ["public_profile", "email"]
        
            self.view.addSubview(login)
        }
    }
    
    func logout()
    {
        FBSDKLoginManager().logOut()
        FBSDKAccessToken.setCurrentAccessToken(nil)
    }
    
    internal func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        if(error != nil)
        {
            print("No se puede completar login con FB")
            
        }
            
        else if result.isCancelled
        {
            print("login was cancelled")
        }
        
        else {
            
            let email = result.valueForKey("email") as! String
            
            print("email = \(email)")
        }
    }
    
    internal func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

