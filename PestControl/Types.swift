//
//  Types.swift
//  PestControl
//
//  Created by Robert Fasciano on 2/1/25.
//  Copyright © 2025 Ray Wenderlich. All rights reserved.
//

import Foundation

enum Direction: Int {
  case forward = 0, backward, left, right
}

enum GameState: Int {
  case initial=0, start, play, win, lose, reload, pause
}

typealias TileCoordinates = (column: Int, row: Int)

struct PhysicsCategory {
  static let None: UInt32 = 0
  static let All: UInt32 = 0xFFFFFFFF
  static let Edge: UInt32 =       0b000001
  static let Player: UInt32 =     0b000010
  static let Bug: UInt32 =        0b000100
  static let Firebug: UInt32 =    0b001000
  static let Breakable: UInt32 =  0b010000
}
