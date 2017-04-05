//
//  ProductImageView.swift
//  QuickApp
//
//  Created by Stephen Fox on 10/09/2016.
//  Copyright © 2016 Stephen Fox. All rights reserved.
//

import UIKit
import Cartography

class ProductImage: UIView {
  var imageView: UIImageView!
  
  init() {
    super.init(frame: CGRect.zero)
    self.setupViews()
  }
  
  fileprivate func setupViews() {
    self.backgroundColor = UIColor.white
    
    self.imageView = UIImageView()
    self.imageView.clipsToBounds = true
    self.imageView.contentMode = .scaleAspectFit
    self.addSubview(self.imageView)
    
    constrain(self, self.imageView) {
      (superView, imageView) in
      imageView.width == superView.width * 0.9
      imageView.height == superView.height
      imageView.center == superView.center
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
