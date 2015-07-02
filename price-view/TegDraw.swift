//
//  Helper functions for drawing lines, shapes etc.
//

import UIKit

class TegDraw {
  class func drawLine(context: CGContext!, color: UIColor, start: CGPoint, end: CGPoint,
    width: CGFloat) {
      
    CGContextBeginPath(context)
    
    CGContextSetStrokeColorWithColor(context, color.CGColor)
    CGContextSetLineWidth(context, width)
    
    CGContextMoveToPoint(context, start.x, start.y)
    CGContextAddLineToPoint(context, end.x, end.y)
    
    CGContextClosePath(context)
    
    CGContextDrawPath(context, .FillStroke)
  }
}
