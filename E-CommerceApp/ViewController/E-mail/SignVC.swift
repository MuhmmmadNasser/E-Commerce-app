//
//  SignVC.swift
//  E-CommerceApp
//
//  Created by Mohamed on 17/09/2021.
//

import UIKit
import iOSDropDown

class SignVC: UIViewController {
    
    //MARK: - Variables
    let defaults = UserDefaults.standard
    
    //MARK: - OutLets
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    
    //SignUp
    @IBOutlet weak var signUpBtnOutlet: UIButton!
    @IBOutlet weak var signUpUnderView: UIView!
    @IBOutlet weak var signUpView: UIView!
    //SignIn
    @IBOutlet weak var signInBtnOutlet: UIButton!
    @IBOutlet weak var signInUnderView: UIView!
    @IBOutlet weak var signInView: UIView!
    
    
    //Sign In View outLets
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    //Sign Up View OutLets
    @IBOutlet weak var signUpNameTF: UITextField!
    @IBOutlet weak var signUpEmailTF: UITextField!
    @IBOutlet weak var signUpPhoneTF: UITextField!
    @IBOutlet weak var signUpGovernmentDropDownTF: DropDown!
    @IBOutlet weak var signUpCityTF: UITextField!
    @IBOutlet weak var signUpPasswordTF: UITextField!
    @IBOutlet weak var signUpConfirmPassTF: UITextField!
    
    
    //SignUP NotVaild Label
    @IBOutlet weak var mailAlertLabel: UILabel!
    @IBOutlet weak var phoneAlertLabel: UILabel!
    @IBOutlet weak var passwordAlertLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboard()
        swapSignView(state: 2)
        NotificationCenter.default.addObserver(self, selector: #selector(self.ckeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.ckeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        getGovern(urlString: URLConfigFile.governUrl)
        
    }
    
    func getGovern(urlString: String){
        ApiServices.instance.getModel(urlString: urlString) { [self] (governModel: [GovernModel]?, error) in
            guard let governModel = governModel else{
                return
            }
            var nameArray :[String] = []
            var idsArray: [Int] = []
            
            for gov in governModel{
                nameArray.append(gov.name!)
                idsArray.append(Int(gov.id!)!)
                //                let id = Int(gov.id!)
                //                idsArr.append(id!)
            }
            DispatchQueue.main.async {
                signUpGovernmentDropDownTF.optionArray = nameArray
                signUpGovernmentDropDownTF.optionIds = idsArray
                signUpGovernmentDropDownTF.didSelect { selectText, index, id in
                signUpGovernmentDropDownTF.text = "Select Text: \(selectText) \n index: \(index) id: \(id)"
                }
            }
        }
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
    
    func swapSignView(state: Int){
        switch state {
        case 1:
            signUpBtnOutlet.titleLabel?.font = UIFont(name: "Helvetica Neue Bold", size: 16)
            signInBtnOutlet.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 16)
            signUpView.isHidden = false
            signInView.isHidden = true
            UIView.animate(withDuration: 0.3) { [self] in
                signUpUnderView.backgroundColor = #colorLiteral(red: 0.6692921519, green: 0.79661268, blue: 0.6413914561, alpha: 1)
                signInUnderView.backgroundColor = .clear
                view.layoutIfNeeded()
            }
            
        case 2:
            signInBtnOutlet.titleLabel?.font = UIFont(name: "Helvetica Neue Bold", size: 16)
            signUpBtnOutlet.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 16)
            signUpView.isHidden = true
            signInView.isHidden = false
            UIView.animate(withDuration: 0.3) { [self] in
                signUpUnderView.backgroundColor = .clear
                signInUnderView.backgroundColor = #colorLiteral(red: 0.6692921519, green: 0.79661268, blue: 0.6413914561, alpha: 1)
                view.layoutIfNeeded()
            }
            
        default:
            print("Enter 1 or 2 ")
        }
    }
    
    @IBAction func toSignUpClicked(_ sender: Any) {
        swapSignView(state: 1)
    }
    @IBAction func toLogInClicked(_ sender: Any) {
        swapSignView(state: 2)
    }
    
    
    //MARK: - SIGN UP ACTION
    @IBAction func signUpClicked(_ sender: Any) {
        
        let name = signUpNameTF.text!
        let email = signUpEmailTF.text!
        let government = signUpGovernmentDropDownTF.text!
        let city = signUpCityTF.text!
        let phone = signUpPhoneTF.text!
        let password = signUpPasswordTF.text!
        let confirmPassword = signUpConfirmPassTF.text!
        
        if name == ""{
            presentAlert(withTitle: "Fill name", message: "You should fill name First")
        }
        else if email == "" && email.isValidEmail == false{
//            phoneAlertLabel.isHidden = true
//            mailAlertLabel.isHidden = false
            presentAlert(withTitle: "Fill Email", message: "You should fill Email First")
        }
        else if government == ""{
            //mailAlertLabel.isHidden = true
            presentAlert(withTitle: "Fill government", message: "You should fill government First")
        }
        else if city == ""{
            presentAlert(withTitle: "Fill city", message: "You should fill city First")
        }
        else if phone == "" && phone.isValidPhone == false{
            //phoneAlertLabel.isHidden = false
            presentAlert(withTitle: "Fill phone", message: "You should fill phone First")
        }
        else if password == "" && password.isPassValid == false{
            //passwordAlertLabel.isHidden = false
            presentAlert(withTitle: "Fill Password", message: "You should fill Password First")
        }
        else if confirmPassword == ""{
            //passwordAlertLabel.isHidden = false
            presentAlert(withTitle: "Fill confirmPassword", message: "You should fill confirmPassword First")
        }
        else{
            
            var userData = UserData(password: password, name: name, email: email, government: government, phone: phone)
            let userModel = UserModel(data: userData)
            
            DispatchQueue.global(qos: .background).async {
                ApiServices.instance.postJsonModelGetModel(urlString: URLConfigFile.userSignUpUrl, list: userModel) { (userModel: UserModel?, error) in
                    guard let userModel = userModel else{
                        return
                    }
                    if userModel.message == "email is exist"{
                        self.presentAlert(withTitle: "email is exist", message: "email is exist")
                    }else if userModel.message == "Confirmation Code is Sent To Your Mail"{
                        print("Confirmation Code is Sent To Your Mail")
                        
                        DispatchQueue.main.async { [self] in
                            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let vc = mainStoryboard.instantiateViewController(identifier: "ConfirmCodeVC") as! ConfirmCodeVC
                            vc.userMail = emailTF.text!
                            vc.modalTransitionStyle = .flipHorizontal
                            UIApplication.shared.windows.first?.rootViewController = vc
                            UIApplication.shared.windows.first?.makeKeyAndVisible()
                        }
                    }
                }
            }
        }
        
    }
    
    
    
    //MARK: - SIGN IN ACTION
    @IBAction func signInCliked(_ sender: Any) {
        
        if emailTF.text == ""{
            presentAlert(withTitle: "Fill all fields", message: "you should fill email first")
        }
        else if passwordTF.text == ""{
            presentAlert(withTitle: "Fill all fields", message: "you should fill password first")
        }
        else{
            logIn()
        }
    }
    func logIn(){
        guard let email = emailTF.text else {
            return
        }
        guard let password = passwordTF.text else {
            return
        }
        DispatchQueue.global(qos: .background).async { [self] in
            ApiServices.instance.postTwoStringsGetModel(urlString: URLConfigFile.userLoginUrl, param1: email, param1Key: "emailOrPhone", param2: password, param2Key: "password") { (userModel: UserModel?, error) in

                guard let userModel = userModel else{return}
                if userModel.message == "Password Is Incorrect "{
                    DispatchQueue.main.async {
                        presentAlert(withTitle: "Wrong Password", message: "Enter correct password")
                    }
                    
                }else if userModel.message == " Mail Is Incorrect "{
                    DispatchQueue.main.async {
                        presentAlert(withTitle: "Not registar", message: "Registar first")
                    }
                }else if userModel.message == "Mail isn't confirmed "{
                    DispatchQueue.main.async {
                        presentAlert(withTitle: "Mail isn't confirmed", message: "Confirm Your Mail First")
                    }
                }else{
                    
                    defaults.setValue(userModel.data?.id, forKey: UserDefaultsKeys.userId)
                    defaults.setValue(userModel.data?.name, forKey: UserDefaultsKeys.userName)
                    defaults.setValue(userModel.data?.city, forKey: UserDefaultsKeys.userCity)
                    defaults.setValue(userModel.data?.government, forKey: UserDefaultsKeys.userGovernment)
                    defaults.setValue(userModel.data?.bio, forKey: UserDefaultsKeys.userBio)
                    defaults.setValue(userModel.data?.image, forKey: UserDefaultsKeys.userImage)
                    defaults.setValue(userModel.data?.email, forKey: UserDefaultsKeys.userCity)
                    defaults.setValue(userModel.data?.city, forKey: UserDefaultsKeys.city)
                    defaults.setValue(userModel.data?.phone, forKey: UserDefaultsKeys.userPhone)
                    
                    DispatchQueue.main.async {
                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = mainStoryboard.instantiateViewController(identifier: "MyTabBar") as! MyTabBar
                        vc.modalTransitionStyle = .flipHorizontal
                        UIApplication.shared.windows.first?.rootViewController = vc
                        UIApplication.shared.windows.first?.makeKeyAndVisible()
                    }
                    
                }
            }
        }
        
    }
    
    
    
    @IBAction func forgetPasswordClicked(_ sender: Any) {
        
        
    }
    
    //MARK: - Not Valid Label
    @IBAction func isValidEmailAction(_ sender: Any) {
        if signUpEmailTF.text?.isValidEmail == true{
            mailAlertLabel.isHidden = true
        }else{
            mailAlertLabel.isHidden = false
        }
    }
    
    @IBAction func isValidPhoneAction(_ sender: Any) {
        if signUpPhoneTF.text?.isValidPhone == true{
            phoneAlertLabel.isHidden = true
        }else{
            phoneAlertLabel.isHidden = false
        }
    }
    
    @IBAction func isValidPasswordAction(_ sender: Any) {
        if signUpPasswordTF.text?.isPassValid == true{
            passwordAlertLabel.isHidden = true
        }else{
            passwordAlertLabel.isHidden = false
        }
    }
    
    
    
}
