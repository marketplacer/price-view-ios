//
//  ViewController.swift
//  price-view
//
//  Created by Evgenii Neumerzhitckii on 26/11/2014.
//  Copyright (c) 2014 The Exchange Group Pty Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var priceView: TegPriceView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

//    priceView.backgroundColor = nil
  }


  @IBAction func onShowOnePriceTapped(sender: AnyObject) {
    priceView.show("$12.99")
  }

  @IBAction func onShowTwoPricesTapped(sender: AnyObject) {
    priceView.show("$1,200", priceBeforeDiscount: "$1.300")
  }
}

