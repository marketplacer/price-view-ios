import UIKit

class TegStrikethroughTextLayer: CATextLayer {
  var color = UIColor.grayColor()
  
  override func drawInContext(context: CGContext) {
    super.drawInContext(context)
    
    TegDraw.drawLine(context,
      color: color,
      start: CGPoint(x: bounds.minX, y: bounds.midY),
      end: CGPoint(x: bounds.maxX, y: bounds.midY),
      width: 1
    )
  }
}
