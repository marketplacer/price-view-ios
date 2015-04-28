import UIKit

class TegPriceView: UIView {
  var size = CGSize()

  var priceFont = UIFont.boldSystemFontOfSize(19)
  var priceBeforeDiscountFont = UIFont.systemFontOfSize(19)
  
  var priceColor = UIColor.blackColor()
  var priceBeforeDiscountColor = UIColor.grayColor()

  var marginBetweenPrices: CGFloat = 5

  func show(price: String, priceBeforeDiscount: String? = nil) {
    layer.sublayers = nil

    // Show price
    let priceLayer = CATextLayer()
    TegPriceView.styleTextLayer(priceLayer, text: price, font: priceFont)
    priceLayer.foregroundColor = priceColor.CGColor
    layer.addSublayer(priceLayer)

    size = priceLayer.bounds.size
 
    // Show price before discount
    if let priceBeforeDiscount = priceBeforeDiscount {
      let priceBeforeDiscountLayer = TegStrikethroughTextLayer()
      priceBeforeDiscountLayer.color = priceBeforeDiscountColor
      
      TegPriceView.styleTextLayer(priceBeforeDiscountLayer,
        text: priceBeforeDiscount, font: priceBeforeDiscountFont)
      
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
