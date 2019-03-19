import Foundation
import PlaygroundSupport
import SpriteKit
import UIKit

public class GameScene : SKScene , SKPhysicsContactDelegate{
    
    
    var corner1:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "Corner1.png"))
    var corner2:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "Corner2.png"))
    var corner3:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "Corner3.png"))
    var corner4:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "Corner4.png"))
    
    var x1:CGFloat = 0
    var x2:CGFloat = 0
    var y1:CGFloat = 0
    var y2:CGFloat = 0
    
    var fX:CGFloat = 0
    var fY:CGFloat = 0
    
    var grape:Player = Player(Image: SKSpriteNode(imageNamed: "grape.png"))
    
    var obs1:Obstacle = Obstacle(Image: SKSpriteNode(imageNamed: "triangle.png"), imageName: "triangle.png")
    
    var goal:Goal! = Goal(Image: SKSpriteNode(imageNamed: "goal.png"), imageName: "goal.png")
    
//    let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
//    // 2
//    
//    borderBody.friction = 0
//    // 3
//    self.physicsBody = borderBody
    
    public override func didMove(to view: SKView) {
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.friction = 0
        self.physicsBody = borderBody
        
        
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        physicsWorld.contactDelegate = self
    }
    
    public override func sceneDidLoad() {

        let frameX = self.frame.size.width / 2
        let frameY = self.frame.size.height / 2
        
        //Grape
        grape.position = CGPoint(x: frameX, y: frameY)
        self.addChild(grape)
        
        //Obs1
        obs1.position = CGPoint(x: self.frame.size.width / 2, y: self.size.height / 2)
        self.addChild(obs1)
        
        //Goal
        goal.position = CGPoint(x: 20, y: 20)
        self.addChild(goal)
        
        //Background
        self.addChild(corner1)
        self.addChild(corner2)
        self.addChild(corner3)
        self.addChild(corner4)
    }
    
    func touchDown(atPoint:CGPoint){
        x1 = grape.position.x
        y1 = grape.position.y
    }
    
    func touchMoved(atPoint:CGPoint){
        grape.position = atPoint
    }
    
    func touchUp(atPoint:CGPoint){
        
        x2 = grape.position.x
        y2 = grape.position.y
        
        fX = (x2-x1) / 1
        fY = (y2-y1) / 1
        
        
        grape.physicsBody?.applyImpulse(CGVector(dx: -fX, dy: -fY), at: atPoint)
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            touchDown(atPoint: t.location(in: self))
        }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            touchMoved(atPoint: t.location(in: self))
            
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
    
    //
    public override func didChangeSize(_ oldSize: CGSize) {
        //redimensiona cada um dos elementos de acordo com a porcentagem da largura da tela
        if size.height > size.width {
            resizeObjByWidth(obj:corner1, new_width:size.width * 0.2)
            resizeObjByWidth(obj:corner2, new_width:size.width * 0.2)
            resizeObjByWidth(obj:corner3, new_width:size.width * 0.2)
            resizeObjByWidth(obj:corner4, new_width:size.width * 0.2)
        } else {
            resizeObjByHeight(obj:corner1, new_height:size.height * 0.2)
            resizeObjByHeight(obj:corner2, new_height:size.height * 0.2)
            resizeObjByHeight(obj:corner3, new_height:size.height * 0.2)
            resizeObjByHeight(obj:corner4, new_height:size.height * 0.2)
        }
        
        //reposiciona os elementos em cena
        corner1.position = CGPoint(x: corner1.size.width/2, y: size.height - corner1.size.height/2)
        corner2.position = CGPoint(x: size.width - corner2.size.width/2, y: size.height - corner2.size.height/2)
        corner3.position = CGPoint(x: size.width - corner3.size.width/2, y: corner3.size.height/2)
        corner4.position = CGPoint(x: corner4.size.width/2, y: corner4.size.height/2)
    }
    
    func resizeObjByWidth(obj:SKSpriteNode, new_width:CGFloat){
        let w_old = obj.size.width
        let h_old = obj.size.height
        let w_new = new_width
        let h_new = w_new * h_old/w_old
        obj.size = CGSize(width: w_new, height: h_new)
    }
    
    func resizeObjByHeight(obj:SKSpriteNode, new_height:CGFloat){
        let w_old = obj.size.width
        let h_old = obj.size.height
        let h_new = new_height
        let w_new = h_new * w_old/h_old
        obj.size = CGSize(width: w_new, height: h_new)
    }
//    physicsWorld.contactDelegate = self
}
