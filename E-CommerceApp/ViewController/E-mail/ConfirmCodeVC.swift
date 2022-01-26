//
//  ConfirmCodeViewController.swift
//  E-CommerceApp
//
//  Created by Mohamed on 12/09/2021.
//

import UIKit

class ConfirmCodeVC: UIViewController {
    
    var userMail = ""
    
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var confirmCodeTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboard()
        NotificationCenter.default.addObserver(self, selector: #selector(self.ckeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.ckeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func ckeyboardWillShow(notification: Notification) {
        if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            UIView.animate(withDuration: 0.3) {
                self.scrollViewBottomConstraint.constant = keyboardHeight
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func ckeyboardWillHide(notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.scrollViewBottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    @IBAction func confirmBtnClicked(_ sender: Any) {
        
        if confirmCodeTF.text == ""{
            presentAlert(withTitle: "Fill code", message: "Fill code")
        }else{
            DispatchQueue.global(qos: .background).async { [self] in
                ApiServices.instance.postTwoStringsGetModel(urlString: URLConfigFile.emailConfirmUrl, param1: userMail, param1Key: "email", param2: confirmCodeTF.text!, param2Key: "code") { (userModel: UserModel?, error) in
                    
                    guard let userModel = userModel else{
                        return
                    }
                    if userModel.message == "Code Incorrect"{
                        presentAlert(withTitle: "Code Incorrect", message: "Enter the correct code")
                    }
                    else if userModel.message == "Now You Are Set"{
                        //go to signIn
                        DispatchQueue.main.async {
                            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let vc = mainStoryboard.instantiateViewController(identifier: "SignVC") as! SignVC
                            vc.modalTransitionStyle = .flipHorizontal
                            UIApplication.shared.windows.first?.rootViewController = vc
                            UIApplication.shared.windows.first?.makeKeyAndVisible()
                        }
                        // go to home by tabBar
                        DispatchQueue.main.async {
                            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let vc = mainStoryboard.instantiateViewController(identifier: "MyTabBar") as! MyTabBar
                            vc.modalTransitionStyle = .flipHorizontal
                            UIApplication.shared.windows.first?.rootViewController = vc
                            UIApplication.shared.windows.first?.makeKeyAndVisible()
                        }
                        
                        //save userData to userDefaults
                        let userDefaults = UserDefaults.standard
                        userDefaults.setValue(userModel.data?.id, forKey: UserDefaultsKeys.userId)
                        userDefaults.setValue(userModel.data?.name, forKey: UserDefaultsKeys.userName)
                        userDefaults.setValue(userModel.data?.phone, forKey: UserDefaultsKeys.userPhone)
                        userDefaults.setValue(userModel.data?.government, forKey: UserDefaultsKeys.userGovernment)
                        userDefaults.setValue(userModel.data?.password, forKey: UserDefaultsKeys.userPassword)
                    }
                }
            }
        }
        
    }
    
    @IBAction func dismissBtnClicked(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(identifier: "ForgetPasswordVC") as! ForgetPasswordVC
        vc.modalTransitionStyle = .flipHorizontal
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
    
    
}
