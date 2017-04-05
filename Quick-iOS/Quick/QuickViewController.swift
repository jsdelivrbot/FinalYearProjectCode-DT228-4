//
//  QuickViewController.swift
//  Quick
//
//  Created by Stephen Fox on 02/07/2016.
//  Copyright © 2016 Stephen Fox. All rights reserved.
//

import UIKit


class QuickViewController: UIViewController {
  
  var index: NSInteger?
  
  /// Sets the navigationController's navigation bar to completely hidden
  internal var hideNavigationBar: Bool {
    get {
      return self.navigationController!.navigationBar.isHidden
    }
    set {
      if (newValue) {
        self.navigationController?.navigationBar.isHidden = true
      } else {
        self.navigationController?.navigationBar.isHidden = false
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.white
    self.edgesForExtendedLayout = []
  }
  
  fileprivate func setupViews() {
    //Ensures that views are not underneath the tab bar
    if tabBarController?.tabBar.isHidden == false {
      let viewBounds = self.view.bounds;
      let bottomBarOffset = self.bottomLayoutGuide.length;
      self.view.frame = CGRect(x: 0, y: 0, width: viewBounds.width, height: viewBounds.height - bottomBarOffset)
    }
  }
  
  
  /**
   Displays an alert to the user.
   - parameter title: The title of the alert.
   - parameter message: The message use in the alert.
   */
  internal func displayMessage(title: String, message: String) {
    let alertController = UIAlertController(title: title,
                                            message:message,
                                            preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "Done",
      style: UIAlertActionStyle.default,
      handler: nil))
    self.present(alertController, animated: true, completion: nil)
  }
  
  
  
  internal func displayQRCodeDetailView(title: String, message: String, qrCodeSeed: String) {
    let alertController = UIAlertController(title: title,
                                            message:message,
                                            preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "Done",
      style: UIAlertActionStyle.default,
      handler: nil))
    let qrCodeImage = QRCode.generateFromString(qrCodeSeed)
    let qrCodeImageView = UIImageView(image: qrCodeImage)
    alertController.view.addSubview(qrCodeImageView)
    self.present(alertController, animated: true, completion: nil)
  }
}
