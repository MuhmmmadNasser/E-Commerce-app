//
//  UICollectionViewExtentions.swift
//  Foodo
//
//  Created by Rivile on 2/3/20.
//  Copyright © 2020 Rivile. All rights reserved.
//

import UIKit

extension UICollectionView{
    func registerNib<Cell: UICollectionViewCell>(cell: Cell.Type){
        let nibName = String(describing: Cell.self)
        
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    func dequeue<Cell: UICollectionViewCell>(index: IndexPath) -> Cell{
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: index) as? Cell else {fatalError("Error in cell")}
        return cell
    }
}
