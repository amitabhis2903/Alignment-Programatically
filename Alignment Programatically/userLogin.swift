//
//  userLogin.swift
//  Alignment Programatically
//
//  Created by Ammy Pandey on 27/08/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit

enum fieldType
{
    case Email
    case Password
}

class userLogin: UIView, UITextFieldDelegate
{
    var type: fieldType = .Email
    private let label:  UILabel = UILabel()
    private let textField: UITextField = UITextField()
    private let bottomLineView: UIView = UIView()
    
    
    init(frame: CGRect, type: fieldType)
    {
        self.type = type
        super.init(frame: frame)
        self.setup()
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.setup()
    }
    private func setup()
    {
        // Mark: properties for label
        self.addSubview(label)
        self.label.text = self.type == .Email ? "Email" : "Password"
        self.label.textAlignment = .left
        self.label.textColor = UIColor.blue
        self.label.alpha = 0
        self.label.font = UIFont.systemFont(ofSize: 12)
        self.label.frame = CGRect(x: 0, y: self.bounds.height / 2, width: self.bounds.width, height: 20)
        
        
        
        //Mark: Propertis for uiview
        self.addSubview(bottomLineView)
        self.bottomLineView.backgroundColor = UIColor.lightGray
        self.bottomLineView.frame = CGRect(x: 0, y: self.bounds.height, width: self.bounds.width, height: 1)
        
        
        //Mark: Properties for textField
        self.addSubview(textField)
        self.textField.placeholder = self.type == .Email ? "Email" : "Password"
        self.textField.isSecureTextEntry = self.type == .Password
        self.textField.textAlignment =  .left
        self.textField.frame = CGRect(x: 0, y: 19, width: self.bounds.width, height: 20)
        self.textField.addTarget(self, action: #selector(userLogin.chckLabel(sender: )), for: .editingChanged)
        
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField.text?.characters.count)! > 0
        {
            self.label.textColor = UIColor.blue
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text?.characters.count)! > 0
        {
          self.label.textColor = UIColor.gray
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: { 
                self.label.alpha = 0
            }, completion: { done in
                self.label.textColor = UIColor.blue
                self.label.frame = CGRect(x: 0, y: self.bounds.height / 2, width: self.bounds.width, height: 20)
            })
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.endEditing(true)
        return false
    }
    
    func chckLabel(sender: UITextField)
    {
        guard (sender.text?.characters.count)! > 0 else
        {
            return
        }
        
        UIView.animate(withDuration: 0.5) {
            self.label.alpha = 1
            self.label.frame = CGRect(x: 0, y: 2, width: self.bounds.width, height: 20)
        }

    }
    
    
}
