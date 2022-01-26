//
//  HomeVC.swift
//  E-CommerceApp
//
//  Created by Mohamed on 26/09/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: - Variables
    let defaults = UserDefaults.standard
    var productsArray: [ProductModel] = []
    
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var changeLayoutBtnOutLet: UIButton!
    
    //Show Product
    @IBOutlet weak var allProductBtnOutlet: UIButton!
    @IBOutlet weak var camerasBtnOutlet: UIButton!
    @IBOutlet weak var gpsBtnOutlet: UIButton!
    @IBOutlet weak var showProductsViewConstrain: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "HorizontalProductCVCell", bundle: nil), forCellWithReuseIdentifier: "HorizontalProductCVCell")
        collectionView.registerNib(cell: VerticalProductsCVCell.self)
        
        setupVerticalUI()
        
        /*  // another way of collectionView autlet
         let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
         collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
         collectionViewLayout.itemSize = CGSize(width: (self.view.frame.width), height: 200)
         collectionViewLayout.minimumInteritemSpacing = 0
         collectionViewLayout.minimumLineSpacing = 0
         collectionViewLayout.scrollDirection = .vertical
         self.collectionView!.collectionViewLayout = collectionViewLayout
         */
        
        getModel()
    }
    func getModel(){
        let userId = defaults.string(forKey: UserDefaultsKeys.userId)
        ApiServices.instance.postStringsGetModel(urlString: URLConfigFile.productsGetUrl, param1: "10", param1Key: "userId") { [self] (productModel: [ProductModel]?, error) in
            guard let productModel = productModel else{
                return
            }
            DispatchQueue.main.async {
                productsArray = productModel
                collectionView.reloadData()
            }
        }
    }
    
    
    @IBAction func changeLayoutBtnClicked(_ sender: UIButton) {
        if sender.isSelected == true{
            setupHorizontalUI()
        }else{
            setupVerticalUI()
        }
    }
    
    
    //MARK: - SHOW PRODUCTS ALL, CAMERAS AND GPS
    @IBAction func showProductsBtnClicked(_ sender: UIButton) {
        if showProductsViewConstrain.constant == -300{
            animatedUIView(const: 5)
        }else{
            animatedUIView(const: -300)
        }
    }
    @IBAction func allProductBtnClicked(_ sender: UIButton) {
        if sender.isSelected == true {
            sender.isSelected = false
            camerasBtnOutlet.isSelected = false
            gpsBtnOutlet.isSelected = false
        }
        changeLayoutBtnOutLet.setTitle(sender.titleLabel?.text, for: .normal)
        animatedUIView(const: -300)
    }
    @IBAction func camerasBtnClicked(_ sender: UIButton) {
        //fill array with cam data
        //dataArry = camDataArry
        if sender.isSelected == true {
            sender.isSelected = false
            allProductBtnOutlet.isSelected = false
            gpsBtnOutlet.isSelected = false
        }
        //change Btn image
        changeLayoutBtnOutLet.setTitle(sender.titleLabel?.text, for: .normal)
        
        //reload data and hide view
        animatedUIView(const: -300)
    }
    
    @IBAction func gpsBtnClicked(_ sender: UIButton) {
        
        if sender.isSelected == true {
            sender.isSelected = false
            allProductBtnOutlet.isSelected = false
            camerasBtnOutlet.isSelected = false
        }
        
        changeLayoutBtnOutLet.setTitle(sender.titleLabel?.text, for: .normal)
        animatedUIView(const: -300)
        
    }
    
    
    func animatedUIView(const: Int){
        UIView.animate(withDuration: 0.4) {
            self.showProductsViewConstrain.constant = CGFloat(const)
            self.view.layoutIfNeeded()
        }
        collectionView.reloadData()
    }
}


//MARK: - EXTENTION COLLECTION VIEW FOR SHOW PRODUCTS
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if changeLayoutBtnOutLet.isSelected == true{
            //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerticalProductsCVCell", for: indexPath) as! VerticalProductsCVCell
            let cell = collectionView.dequeue(index: indexPath) as VerticalProductsCVCell
            cell.descriptionCell.text = productsArray[indexPath.row].lDescription
            
            ApiServices.instance.downloadImage(from: productsArray[indexPath.row].image!, imageView: cell.imageCell)
            
            return cell
        }else{
            let cell = collectionView.dequeue(index: indexPath) as HorizontalProductCVCell
            cell.descriptionCell.text = productsArray[indexPath.row].lDescription
            
            ApiServices.instance.downloadImage(from: productsArray[indexPath.row].image!, imageView: cell.imageCell)
            return cell
        }
    }
    
    func setupHorizontalUI(){
        changeLayoutBtnOutLet.isSelected = false
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.65)), subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = layout
        collectionView.reloadData()
    }
    
    func setupVerticalUI(){
        changeLayoutBtnOutLet.isSelected = true
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.50)), subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = layout
        collectionView.reloadData()
    }
    
    
}
