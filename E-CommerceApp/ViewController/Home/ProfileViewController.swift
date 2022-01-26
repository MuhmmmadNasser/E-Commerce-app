//
//  ProfileViewController.swift
//  E-CommerceApp
//
//  Created by Mohamed on 13/09/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: - VARIABLES
    
    let userDefaults = UserDefaults.standard
    
    //MARK: - OUTLETS
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var governmentLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //circle image
        profileImg.clipsToBounds = true
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
        
        //UserDefaults
//        nameabel.text = userDefaults.string(forKey: "userName")
//        cityLabel.text = userDefaults.string(forKey: "userCity")
//        governmentLabel.text = userDefaults.string(forKey: "userGovernment")
//        bioLabel.text = userDefaults.string(forKey: "userBio")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
