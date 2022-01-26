//
//  EditProfileViewController.swift
//  E-CommerceApp
//
//  Created by Mohamed on 13/09/2021.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //circle image
        profileImg.clipsToBounds = true
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
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
