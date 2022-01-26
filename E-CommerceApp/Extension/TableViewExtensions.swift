//
//  TableViewExtensions.swift
//  Foodo
//
//  Created by Rivile on 2/1/20.
//  Copyright © 2020 Rivile. All rights reserved.
//

import UIKit

extension UITableView{
    func registerNib<Cell: UITableViewCell>(cell: Cell.Type){
        let nibName = String(describing: Cell.self)
        
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func dequeue<Cell: UITableViewCell>() -> Cell{
        let identifier = String(describing: Cell.self)
        
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {fatalError("Error in cell")}
        return cell
    }
    
    
}
final class ContentSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
