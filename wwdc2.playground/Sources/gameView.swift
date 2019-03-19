import Foundation
import PlaygroundSupport
import SpriteKit
import UIKit

/*
public class GameSceneOld: SKScene, SKPhysicsContactDelegate {
    
    private var label : SKLabelNode!
    
    private var grapeTouched = false
    
    private var grape : SKSpriteNode!
    private var nossaGrape:SKNode!
    private var goal : SKSpriteNode!
    
    private var lineR : SKSpriteNode!
    private var lineL : SKSpriteNode!
    private var lineU : SKSpriteNode!
    private var lineD : SKSpriteNode!
    
    
    private var cubeRU : SKSpriteNode!
    private var cubeRD : SKSpriteNode!
    private var cubeLU : SKSpriteNode!
    private var cubeLD : SKSpriteNode!
    
    
    private var rectangle : SKSpriteNode!
    private var triangle : SKSpriteNode!
    
    private var spinnyNode : SKShapeNode!
//    var button : UIButton!
    
    
    
    public override func didMove(to view: SKView) {
        // Get label node from scene and store it for use later
        
        //GRAPE
        
        grape = SKSpriteNode(imageNamed: "grape.png")
        //grape = SKSpriteNode(texture: SKTexture(imageNamed: "grape.png"), color: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), size: CGSize(width: 50, height: 50))
        
        nossaGrape = SKNode()
        nossaGrape.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "grape.png"), size: CGSize(width: grape.size.width, height: grape.size.height))
        nossaGrape.addChild(grape)
        nossaGrape.physicsBody?.affectedByGravity = false
//        grape.addChild(image)
        
        
        
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        // 2
        borderBody.friction = 0
        // 3
        self.physicsBody = borderBody
        
        
        
        nossaGrape.physicsBody!.applyImpulse(CGVector(dx: 2.0, dy: -2.0))
        self.addChild(nossaGrape)
        
        nossaGrape.name = "grape"
        
        print("sadas")
        
        //GOAL
        goal = SKSpriteNode(texture: SKTexture(imageNamed: "goal.png"), color: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), size: CGSize(width: 50, height: 50))
        goal.position = CGPoint(x: self.size.width/4, y: 0)
        self.addChild(goal)
        
        
        
        //TRIANGLE
        triangle = SKSpriteNode(texture: SKTexture(imageNamed: "triangle.png"), color: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), size: CGSize(width: 50, height: 50))
        triangle.position = CGPoint(x: self.size.width/4, y: self.size.height/4)
        self.addChild(triangle)
        
        
        //RECTANGLE
        rectangle = SKSpriteNode(texture: SKTexture(imageNamed: "rectangle.png"), color: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), size: CGSize(width: 50, height: 50))
        rectangle.position = CGPoint(x: -self.size.width/4, y: -self.size.height/4)
        self.addChild(rectangle)
        
        
        
        
        
        //LINE RIGHT
        lineR = SKSpriteNode(color: #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), size: CGSize(width: self.size.height / 8, height: self.size.height))
        lineR.position = CGPoint(x: (self.size.width/2) - (lineR.size.width/2) , y: 0)
        self.addChild(lineR)
        
        
        
        //LINE LEFT
        
        lineL = SKSpriteNode(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), size: CGSize(width: self.size.height / 8, height: self.size.height))
        lineL.position = CGPoint(x: -(self.size.width/2) + (lineL.size.width/2), y: 0)
        self.addChild(lineL)
        
        
        //LINE UP
        
        lineU = SKSpriteNode(color: #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), size: CGSize(width: self.size.width , height: self.size.height / 8))
        lineU.position = CGPoint(x: 0 , y: (self.size.height/2) - (lineU.size.height/2))
        self.addChild(lineU)
        
        
        //LINE DOWN
        
        lineD = SKSpriteNode(color: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), size: CGSize(width: self.size.width, height: self.size.height / 8))
        lineD.position = CGPoint(x: 0 , y: -(self.size.height/2) + (lineD.size.height/2))
        self.addChild(lineD)
       
        
        
        
        //CUBE UP RIGHT
        
        cubeRU = SKSpriteNode(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), size: CGSize(width: self.size.height / 8, height: self.size.height / 8))
        
        
        cubeRU.position = CGPoint( x: (self.size.width/2) - (cubeRU.size.width/2), y: (self.size.height/2) - (cubeRU.size.height/2))
        
        self.addChild(cubeRU)
        
        
        //CUBE DOWN RIGHT
        
        cubeRD = SKSpriteNode(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), size: CGSize(width: self.size.height / 8, height: self.size.height / 8))
        
        
        cubeRD.position = CGPoint( x: (self.size.width/2) - (cubeRD.size.width/2), y: -(self.size.height/2) + (cubeRD.size.height/2))
        
        self.addChild(cubeRD)
        
        
        //CUBE UP LEFT
        
        cubeLU = SKSpriteNode(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), size: CGSize(width: self.size.height / 8, height: self.size.height / 8))
        
        
        cubeLU.position = CGPoint( x:  -(self.size.width/2) + (cubeLU.size.width/2), y: (self.size.height/2) - (cubeRU.size.height/2))
        
        self.addChild(cubeLU)
        
        
        //CUBE DOWN LEFT
        
        cubeLD = SKSpriteNode(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), size: CGSize(width: self.size.height / 8, height: self.size.height / 8))
        
        
        cubeLD.position = CGPoint( x: -(self.size.width/2) + (cubeLD.size.width/2), y: -(self.size.height/2) + (cubeLD.size.height/2))
        
        self.addChild(cubeLD)
        
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        physicsWorld.contactDelegate = self
//
////        label = childNode(withName: "//helloLabel") as? SKLabelNode
////        label.alpha = 0.0
////        let fadeInOut = SKAction.sequence([.fadeIn(withDuration: 2.0),
////                                           .fadeOut(withDuration: 2.0)])
////        label.run(.repeatForever(fadeInOut))
//
//        // Create shape node to use during mouse interaction
//        let w = (size.width + size.height) * 0.05
//
//        spinnyNode = SKShapeNode(rectOf: CGSize(width: w, height: w), cornerRadius: w * 0.3)
//        spinnyNode.lineWidth = 2.5
//
//        let fadeAndRemove = SKAction.sequence([.wait(forDuration: 0.5),
//                                               .fadeOut(withDuration: 0.5),
//                                               .removeFromParent()])
//        spinnyNode.run(.repeatForever(.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//        spinnyNode.run(fadeAndRemove)
    }
    
    
    
    
    
    
    @objc static public override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    
    

    
    
    
    func touchDown(atPoint pos : CGPoint) {
//        guard let n = spinnyNode.copy() as? SKShapeNode else { return }
//
//        n.position = pos
//        n.strokeColor = SKColor.green
//        addChild(n)
//        print(pos)
//        if(pos.x  grape.size.width/2)
//        print(pos)
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        let location = pos
        let node : SKNode = self.atPoint(location)
        if node.name == "grape" {
            
            print("Hello")
            grape.position = CGPoint(x: location.x, y: location.y)
        }
        else {
            nossaGrape.position = CGPoint(x: 0, y: 0)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
//        guard let n = spinnyNode.copy() as? SKShapeNode else { return }
//
//        n.position = pos
//        n.strokeColor = SKColor.red
//        addChild(n)
        //grape.position = CGPoint(x: 0, y: 0)
        nossaGrape.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 0), at: grape.position)
        
        
    }
    
    
    
    
    
    //Touch
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        let touch = touches.first!
//        if grape.contains(touch.location(in: self)){
//            print("touched")
//        }

        
        
        for t in touches {
            touchDown(atPoint: t.location(in: self))
            
        }
        
        
        
        
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            touchMoved(toPoint: t.location(in: self))
            
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            touchUp(atPoint: t.location(in: self))
            
        }
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
*/
