//
//  TegDraw.swift
//
//  Helper functions for drawing lines, shapes etc.
//
//  Created by Evgenii Neumerzhitckii on 27/11/2014.
//  Copyright (c) 2014 The Exchange Group Pty Ltd. All rights reserved.
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
    
    CGContextDrawPath(context, kCGPathFillStroke)
  }
}
