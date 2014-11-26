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

  var marginBetweenPrices: CGFloat = 5

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  func show(price: String, priceBeforeDiscount: String? = nil) {
    layer.sublayers = nil

    let priceLayer = TegPriceView.createTextLayer(price, font: priceFont)
    layer.addSublayer(priceLayer)

    size = priceLayer.bounds.size

    if let currentPriceBeforeDiscount = priceBeforeDiscount {
      let priceBeforeDiscountLayer = TegPriceView.addPriceBeforeDiscount(
        currentPriceBeforeDiscount,
        font: beforeDiscountFont, superlayer: layer,
        position: CGPoint(x: priceLayer.bounds.maxX + marginBetweenPrices, y: 0))

      size.width += priceBeforeDiscountLayer.bounds.width + marginBetweenPrices
    }

    invalidateIntrinsicContentSize()
  }

  private class func addPriceBeforeDiscount(text: String, font: UIFont,
    superlayer: CALayer, position: CGPoint) -> CATextLayer {

    let attributes = [
      NSStrikethroughStyleAttributeName: NSNumber(int: 1),
      NSFontAttributeName: font
    ]

    let attributedString = NSAttributedString(string: text, attributes: attributes)

    let priceBeforeDiscountLayer = TegPriceView.createTextLayer(text, font: font)

    priceBeforeDiscountLayer.string = attributedString

    superlayer.addSublayer(priceBeforeDiscountLayer)

    priceBeforeDiscountLayer.position = position

    return priceBeforeDiscountLayer
  }


  private class func createTextLayer(text: String, font: UIFont) -> CATextLayer {
    let size = NSString(string: text).sizeWithAttributes([NSFontAttributeName: font])

    let layer = CATextLayer()
    layer.font = CGFontCreateWithFontName(font.fontName)
    layer.fontSize = font.pointSize
    layer.foregroundColor = UIColor.blackColor().CGColor
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
