//
//  FavoriteViewController.swift
//  E-CommerceApp
//
//  Created by Mohamed on 13/09/2021.
//

import UIKit

class FavoriteViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
        //tableView.separatorInset = UIEdgeInsets(top: 150, left: 150, bottom: 150, right: 150)
       
    }


       
    
 

}
extension FavoriteViewController:UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SingleFavoriteTableViewCell
        
        
        //cell.separatorInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        /*
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 10
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 10
        cell.layer.shadowOpacity = 0.2
        cell.layer.masksToBounds = true
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        */
        return cell
    }

    
   
    

    
    
    
    
}
