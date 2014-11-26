//
//  TegStrikethroughTextLayer.swift
//  price-view
//
//  Created by Evgenii Neumerzhitckii on 26/11/2014.
//  Copyright (c) 2014 The Exchange Group Pty Ltd. All rights reserved.
//

import UIKit

class TegStrikethroughTextLayer: CATextLayer {
  var color = UIColor.grayColor()
  
  override func drawInContext(context: CGContext!) {
    super.drawInContext(context)
    
    TegDraw.drawLine(context,
      color: color,
      start: CGPoint(x: bounds.minX, y: bounds.midY),
      end: CGPoint(x: bounds.maxX, y: bounds.midY),
      width: 1
    )
  }
}
