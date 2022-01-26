//
//  (Phone&Pass)ValidationExtension.swift
//  Foodo
//
//  Created by Rivile on 2/15/20.
//  Copyright © 2020 Rivile. All rights reserved.
//

import UIKit

// MARK: CHECK VALID FOR PASS, MAIL AND PHONE NUMBER

extension String{
    
    var isPassValid: Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$")
        return passwordTest.evaluate(with: self)
    }
    
    var isValidEmail: Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidPhone: Bool{
        let phoneRegEx = "(01)[0-9]{9}"  // this mean 11 num of egypt number
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }
    
}
