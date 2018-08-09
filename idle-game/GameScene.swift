//
//  GameScene.swift
//  idle-game
//
//  Created by Jacob Mayeux on 8/6/18.
//  Copyright © 2018 Jacob Mayeux. All rights reserved.
//

import SpriteKit
import GameplayKit


// https://blog.kongregate.com/the-math-of-idle-games-part-i/
class Upgrade: SKShapeNode {
	private var basePrice : UInt32 = 1
	private var qty : UInt32 = 0
	private var locked : Bool = true
	private var baseProd : UInt32 = 0 // Amount of production
	
	override init() {
		super.init()
	}
	
	init(rectOf: CGSize) {
		super.init(rectOf: rectOf)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func getPrice() -> UInt32 {
		return UInt32(pow(Double(self.basePrice), Double(self.qty)))
		
	}
	
	func getNumber() -> UInt32 {
		return self.baseProd * self.qty
	}
}

class GameScene: SKScene {
    
//    private var label : SKLabelNode?
//    private var spinnyNode : SKShapeNode?
	private var numberLabel : SKLabelNode?
	private var button1 : SKShapeNode?
	private var rateLabel : SKLabelNode?
	
	private var myNumber : UInt64 = 0
	private var interval : TimeInterval = 0.2
	private var increment : UInt32 = 1

    
    override func didMove(to view: SKView) {
		
		self.numberLabel = self.childNode(withName: "//MyNumber") as? SKLabelNode
		self.button1 = self.childNode(withName: "//button1") as? SKShapeNode
		self.rateLabel = self.childNode(withName: "//MyRate") as? SKLabelNode
		
		if let label = self.numberLabel {
			label.text = String(self.myNumber)
		}
		
        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
		
        // Create shape node to use during mouse interaction
//        let w = (self.size.width + self.size.height) * 0.05
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
    }
    
//
//    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
//    }
//
//    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//    }
//
    func touchUp(atPoint pos : CGPoint) {
//		if let n = self
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//    }
//
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		let pos = touches.first?.location(in: self)

		if let button1 = self.button1 {
			let touchedNode = button1.atPoint(pos!)
			if let name = touchedNode.name {
				if name == "button1" {
					if let label = self.numberLabel {
						label.text = "helo"
						if self.myNumber > 100 {
							self.myNumber -= 100
							self.increment += 1
						}
					}
				}
			}
		}
		
//		let touch:UITouch = touches.anyObject()! as UITouch
//		let positionInScene = touch.locationInNode(self)
//		let touchedNode = self.nodeAtPoint(positionInScene)
//
//		if let name = touchedNode.name
//		{
//			if name == "button1"
//			{
//				print("Touched")
//			}
//		}
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
	private var lastTime : TimeInterval?
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
		if let lastTime = self.lastTime {
			if (currentTime - lastTime >= self.interval) {
				self.myNumber += UInt64(self.increment)
				self.lastTime = lastTime + self.interval
			}
		} else {
			self.lastTime = currentTime
		}
		if let label = self.numberLabel {
			label.text = String(self.myNumber)
		}
		
		if let rateLabel = self.rateLabel {
			rateLabel.text = String((Double(self.increment) / Double(self.interval)))
		}
    }
}
