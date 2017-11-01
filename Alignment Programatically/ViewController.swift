//
//  ViewController.swift
//  Alignment Programatically
//
//  Created by Ammy Pandey on 27/08/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit


class ViewController: UIViewController
{

    let userImg = UILabel()
    var inputEmail: userLogin!
    var inputPassword: userLogin!
    //let loginBtn: UIButton = UIButton()
    
    override func viewDidLoad()
    {
       super.viewDidLoad()
        self.setUserImg()
        
        let x = self.view.bounds.width / 9.375
        let width = self.view.bounds.width - x - x
        let y = userImg.frame.origin.y + userImg.bounds.height + self.view.bounds.height / 3.335
        let height = self.view.bounds.height / 16.675
        
        self.inputEmail = userLogin(frame: CGRect(x: x, y: y, width: width, height: height), type : .Email)
        self.view.addSubview(inputEmail)
        
        let y_second = inputEmail.frame.origin.y + inputEmail.bounds.height + x
       self.inputPassword = userLogin(frame: CGRect(x: x, y: y_second, width: width, height: height), type: .Password)
       self.view.addSubview(inputPassword)
        
        //let y_btn = inputPassword.frame.origin.y + inputPassword.bounds.height + x
        //self.loginBtn.frame = CGRect(x: x, y: y_btn, width: width, height: height)
        //self.view.addSubview(loginBtn)
    }

    func setUserImg()
    {
        let x_view = self.view.bounds.width / 23.4
        let y_view = self.view.bounds.height / 12.82
        let width_view = self.view.bounds.width / 1.09
        let height_view = self.view.bounds.height / 22.23
        self.userImg.text = "Login"
        self.userImg.textAlignment = .center
        self.userImg.font = UIFont.systemFont(ofSize: 25)
        self.userImg.backgroundColor = UIColor.lightGray
        self.userImg.frame = CGRect(x: x_view, y: y_view, width: width_view, height: height_view)
        self.view.addSubview(userImg)
        
    }
   
}

