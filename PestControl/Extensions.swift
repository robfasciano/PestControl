//
//  Extensions.swift
//  PestControl
//
//  Created by Robert Fasciano on 2/1/25.
//  Copyright © 2025 Ray Wenderlich. All rights reserved.
//

import SpriteKit

extension SKTexture {
  convenience init(pixelImageNamed: String) {
    self.init(imageNamed: pixelImageNamed)
    self.filteringMode = .nearest
  }
}
