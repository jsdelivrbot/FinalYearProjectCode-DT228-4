
//
//  ProducTableViewDelegate.swift
//  Quick
//
//  Created by Stephen Fox on 29/06/2016.
//  Copyright © 2016 Stephen Fox. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProductTableViewDataSource: QuickDataSource, UITableViewDataSource {
  
  fileprivate var network: Network!
  fileprivate weak var tableView: QuickTableView!
  fileprivate var products: [Product]?
  fileprivate var reuseIdentifier: String!
  
  
  /**
   Initialises a new instance with a reference to the
   tableView this class will be 'datasourcing'
   - paramater tableView: The table to datasource.
   */
  init(tableView: ProductTableView) {
    super.init()
    self.tableView = tableView
    self.tableView.dataSource = self
    
    self.reuseIdentifier = ProductTableView.cellReuseIdentifier
    self.network = Network()
  }
  
  
  override func fetchData(_ url: String, completetionHandler: @escaping (_ success: Bool) -> Void) {
    self.network.requestJSON(url) { (success, data) in
      if (success && data != nil) {
        let json = JSON(data!)
        self.products = self.createProductArray(json)
        self.tableView.reloadData()
        completetionHandler(true)
      } else {
        fxprint("Could not load Products.")
        completetionHandler(false)
      }
    }
  }
  
  
  fileprivate func createProductArray(_ json: JSON) -> [Product] {
    return JSONParser.parseProducts(json)
  }
  
  
  override func itemForRowIndex(_ indexPath: IndexPath) -> AnyObject? {
    if let p = self.products {
      if p.indices.contains((indexPath as NSIndexPath).row) {
        return p[(indexPath as NSIndexPath).row]
      }
      return nil
    }
    return nil
  }
  
  // MARK: UITableViewDataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if self.products != nil {
      return self.products!.count
    } else {
      return 0
    }
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let productCell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier) as! ProductTableViewCell
    let product = self.products![(indexPath as NSIndexPath).row]
    productCell.setTextElements(product)
    return productCell
  }
}
