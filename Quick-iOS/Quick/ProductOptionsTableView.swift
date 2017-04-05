//
//  ProductOptionsTableView.swift
//  QuickApp
//
//  Created by Stephen Fox on 16/10/2016.
//  Copyright © 2016 Stephen Fox. All rights reserved.
//

import UIKit


/**
 ProductOptionsTableView is the default class used to display
 products options in a table.
 */
class ProductOptionsTableView: QuickTableView, UIViewShadow {
  /**
   The reuse identifier used for table row cells.
   */
  static let cellReuseIdentifier = "productOptionCell"
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setupViews()
  }
  override init(frame: CGRect, style: UITableViewStyle) {
    super.init(frame: frame, style: style)
    self.setupViews()
  }
  init() {
    super.init(frame: CGRect.zero, style: .plain)
    self.setupViews()
  }
  
  func setupViews() {
//    self.addShadow()
  }
  

}
