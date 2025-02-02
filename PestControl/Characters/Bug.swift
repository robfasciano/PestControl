//
//  Bug.swift
//  PestControl
//
//  Created by Robert Fasciano on 2/2/25.
//  Copyright © 2025 Ray Wenderlich. All rights reserved.
//

import SpriteKit

enum BugSettings {
  static let playerSpeed: CGFloat = 280.0
}

class Bug: SKSpriteNode {
  var animations: [SKAction] = []

  required init?(coder aDecoder: NSCoder) {
    fatalError("Use init()")
  }
  
  init() {
    let texture = SKTexture(pixelImageNamed: "bug_ft1")
    super.init(texture: texture, color: .white,
               size: texture.size())
    name = "Bug"
    zPosition = 40
    
    physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
    physicsBody?.restitution = 0.5
    physicsBody?.linearDamping = 0.5
    physicsBody?.friction = 0
    physicsBody?.allowsRotation = false
    
    createAnimations(character: "bug")
  }
  
  func move(target: CGPoint) {
    guard let physicsBody = physicsBody else { return }
    let newVelocity =
    (target - position).normalized() * PlayerSettings.playerSpeed
    physicsBody.velocity = CGVector(point: newVelocity)
    
    checkDirection()
  }
  
  func checkDirection() {
    guard let physicsBody = physicsBody else { return }
    // 1
    let direction =
    animationDirection(for: physicsBody.velocity)
    // 2
    if direction == .left {
      xScale = abs(xScale)
    }
    if direction == .right {
      xScale = -abs(xScale)
    }
    // 3
    run(animations[direction.rawValue], withKey: "animation")
  }
  
}

extension Bug : Animatable {}
