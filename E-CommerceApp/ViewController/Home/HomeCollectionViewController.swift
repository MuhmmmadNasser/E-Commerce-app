//
//  HomeCollectionViewController.swift
//  E-CommerceApp
//
//  Created by Mohamed on 13/09/2021.
//

import UIKit



class HomeCollectionViewController: UICollectionViewController {

   
    
    @IBOutlet weak var sortBtnMenu: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        var imageView = UIImage(systemName: "")?.withTintColor(.red, renderingMode: .alwaysTemplate)
        let sortMenu = UIMenu(title: "Product Show", image: UIImage(named: "image"), options: .destructive, children: [UIAction(title: "All", handler: { _ in
            
            
        }),
        UIAction(title: "cameras",image: imageView, handler: { (_) in
            imageView = UIImage(systemName: "checkmark")
        }),
        UIAction(title: "tracking devices", handler: { (_) in
            
        })])
        
        self.sortBtnMenu.menu = sortMenu
       
        

        //checkmark
 
        setupDoubleUI()
        //setupOneUI()
        
    }
    
    func setupDoubleUI(){
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.43)), subitem: item, count: 2)
     
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        collectionView.collectionViewLayout = layout
        
    }
    func setupOneUI(){
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.45)), subitem: item, count: 2)
     
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        collectionView.collectionViewLayout = layout
        
    }
    


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SingleItemCollectionViewCell
        
//        cell.clipsToBounds = true
//        cell.layer.cornerRadius = 15
        
//        cell.image.image = UIImage(named: "Image-1")
//        cell.image.image = UIImage(systemName: "exclamationmark.triangle.fill")
        /*
        cell.layer.cornerRadius = 15.0
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = 0.0
 */
        /*
        cell.backgroundView?.layer.shadowColor = UIColor.black.cgColor
        cell.backgroundView?.layer.shadowRadius = 5
        cell.backgroundView?.layer.shadowOpacity = 1
        cell.backgroundView?.layer.shadowOffset = CGSize(width: 0, height: 0)
         */
        /*
        //let yourView = UIView()
        cell.viewCell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = .zero
        cell.layer.shadowRadius = 10
        */
        
        //let viewCell = UIView()
        //cell.viewCell.layer.shadowColor = UIColor.black.cgColor
        //cell.viewCell.layer.shadowOpacity = 1
        //cell.viewCell.layer.shadowOffset = .zero
        //cell.viewCell.layer.shadowRadius = 10
        
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
       
        
        /*
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.contentView.layer.cornerRadius = 2.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        */
        
        
       
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
