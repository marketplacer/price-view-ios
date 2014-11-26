//
//  PriceView.swift
//  price-view
//
//  Created by Evgenii Neumerzhitckii on 26/11/2014.
//  Copyright (c) 2014 The Exchange Group Pty Ltd. All rights reserved.
//

import UIKit

class TegPriceView: UIView {
  var size = CGSize()

  var priceFont = UIFont.boldSystemFontOfSize(19)
  var beforeDiscountFont = UIFont.systemFontOfSize(19)
  
  var priceColor = UIColor.blackColor()
  var priceBeforeDiscountColor = UIColor.grayColor()

  var marginBetweenPrices: CGFloat = 5

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  func show(price: String, priceBeforeDiscount: String? = nil) {
    layer.sublayers = nil

    let priceLayer = CATextLayer()
    TegPriceView.styleTextLayer(priceLayer, text: price, font: priceFont)
    priceLayer.foregroundColor = priceColor.CGColor
    layer.addSublayer(priceLayer)

    size = priceLayer.bounds.size
 
    if let currentPriceBeforeDiscount = priceBeforeDiscount {
      let priceBeforeDiscountLayer = TegStrikethroughTextLayer()
      
      TegPriceView.styleTextLayer(priceBeforeDiscountLayer,
        text: currentPriceBeforeDiscount, font: beforeDiscountFont)
      
      layer.addSublayer(priceBeforeDiscountLayer)
      
      priceBeforeDiscountLayer.position = CGPoint(
        x: priceLayer.bounds.maxX + marginBetweenPrices, y: 0)
      
      priceBeforeDiscountLayer.foregroundColor = priceBeforeDiscountColor.CGColor
      
      size.width += priceBeforeDiscountLayer.bounds.width + marginBetweenPrices
    }

    invalidateIntrinsicContentSize()
  }

  private class func styleTextLayer(layer: CATextLayer, text: String, font: UIFont) -> CATextLayer {
    let size = NSString(string: text).sizeWithAttributes([NSFontAttributeName: font])

    layer.font = CGFontCreateWithFontName(font.fontName)
    layer.fontSize = font.pointSize
    layer.string = text
    layer.bounds = CGRect(origin: CGPoint(), size: size)
    layer.contentsScale = UIScreen.mainScreen().scale
    layer.anchorPoint = CGPoint()

    return layer
  }
  
  override func intrinsicContentSize() -> CGSize {
    return size
  }
}
