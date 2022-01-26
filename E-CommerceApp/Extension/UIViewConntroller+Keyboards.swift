//
//  Toast.swift
//  TalabatyDashboard
//
//  Created by Rivile on 2/24/20.
//  Copyright © 2020 Ahmed_mazher. All rights reserved.
//
import UIKit

extension UIViewController {
    
    
    // TO PRESS ANY WHERE TO HIDE KEYBOARD
    func hideKeyboard(){
        let tab:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tab.cancelsTouchesInView = false
        view.addGestureRecognizer(tab)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    // diffrent way
    // TO MAKE KEY BOARD UNDER THE VIEW NEW
    public func KeyboardUnderTheView() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
        
    }
}
