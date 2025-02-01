//
//  Player.swift
//  PestControl
//
//  Created by Robert Fasciano on 2/1/25.
//  Copyright © 2025 Ray Wenderlich. All rights reserved.
//

import SpriteKit

enum PlayerSettings {
  static let playerSpeed: CGFloat = 280.0
}

class Player: SKSpriteNode {
  var animations: [SKAction] = []

  required init?(coder aDecoder: NSCoder) {
    fatalError("Use init()")
  }
  
  init() {
    let texture = SKTexture(imageNamed: "player_ft1")
    super.init(texture: texture, color: .white,
               size: texture.size())
    name = "Player"
    zPosition = 50
    
    physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
    physicsBody?.restitution = 1.0
    physicsBody?.linearDamping = 0.5
    physicsBody?.friction = 0
    physicsBody?.allowsRotation = false
  }
  
  func move(target: CGPoint) {
    guard let physicsBody = physicsBody else { return }
    let newVelocity =
    (target - position).normalized() * PlayerSettings.playerSpeed
    physicsBody.velocity = CGVector(point: newVelocity)
    
    print("* \(animationDirection(for: physicsBody.velocity))")
  }
  
}

extension Player : Animatable {}
