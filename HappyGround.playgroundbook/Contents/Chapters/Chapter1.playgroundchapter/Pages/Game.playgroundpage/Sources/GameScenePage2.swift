import Foundation
import PlaygroundSupport
import SpriteKit
import UIKit
import AVFoundation


public class GameScenePage2 : SKScene , SKPhysicsContactDelegate{
    
    var playerMusic:SKAction!
    
    let frameX = 0.0
    let frameY = 0.0
//    var radiuus: CGFloat! = 20
    var grape: SKShapeNode = SKShapeNode(circleOfRadius: 10 )
    var corner1:SKSpriteNode!
    var corner2:SKSpriteNode!
    var corner3:SKSpriteNode!
    var corner4:SKSpriteNode!

    var bar1:SKSpriteNode!
    var bar2:SKSpriteNode!
    var bar3:SKSpriteNode!
    var bar4:SKSpriteNode!

    
    var obs1:SKSpriteNode!
    var obs2:SKSpriteNode!
    var obs3:SKSpriteNode!
    var obs4:SKSpriteNode!
    
    
    var p0:SKSpriteNode!
    var p10:SKSpriteNode!
    var p20:SKSpriteNode!
    var p40:SKSpriteNode!
    var p70:SKSpriteNode!
    var p100:SKSpriteNode!

    
    var f0:SKSpriteNode!
    var f1:SKSpriteNode!
    var f2:SKSpriteNode!
    var f3:SKSpriteNode!
    
    
    var bolasFaltando:SKLabelNode!
    var bolasNum = 30
    var goal : SKSpriteNode!
    
    var x1:CGFloat = 0
    var x2:CGFloat = 0
    var y1:CGFloat = 0
    var y2:CGFloat = 0
    
    var fX:CGFloat = 0
    var fY:CGFloat = 0
    
    var color = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    
    var novaCor:UIColor!
    var new:String!
    
    var obs1C = false
    var obs2C = false
    var obs3C = false
    var obs4C = false
    var copia = false
    var arrV = ["obs1", "obs3", "obs3", "obs4"]
    var grapeCopy:SKShapeNode!
    var points = 0
    
    var Nterminou = true
    
    public override func didMove(to view: SKView) {
        goal = childNode(withName: "//goal") as? SKSpriteNode
        corner1 = childNode(withName: "//Corner1") as? SKSpriteNode
        corner2 = childNode(withName: "//Corner2") as? SKSpriteNode
        corner3 = childNode(withName: "//Corner3") as? SKSpriteNode
        corner4 = childNode(withName: "//Corner4") as? SKSpriteNode
        bar1 = childNode(withName: "//RectangleRL") as? SKSpriteNode
        bar2 = childNode(withName: "//RectangleW") as? SKSpriteNode
        bar3 = childNode(withName: "//RectangleYL") as? SKSpriteNode
        bar4 = childNode(withName: "//RectangleB") as? SKSpriteNode
  
        obs1 = childNode(withName: "//obs1") as? SKSpriteNode
        obs2 = childNode(withName: "//obs2") as? SKSpriteNode
        obs3 = childNode(withName: "//obs3") as? SKSpriteNode
        obs4 = childNode(withName: "//obs4") as? SKSpriteNode
        
        p0 = childNode(withName: "//p0") as? SKSpriteNode
        p10 = childNode(withName: "//p10") as? SKSpriteNode
        p20 = childNode(withName: "//p20") as? SKSpriteNode
        p40 = childNode(withName: "//p40") as? SKSpriteNode
        p70 = childNode(withName: "//p70") as? SKSpriteNode
        p100 = childNode(withName: "//p100") as? SKSpriteNode
        
        bolasFaltando = childNode(withName: "//bolasFaltando") as? SKLabelNode
//        bolasFaltando.text = String(bolasNum)
//        bolasFaltando.text = "10"

        grape.isHidden = true
        
        f0 = childNode(withName: "//f0") as? SKSpriteNode
        f1 = childNode(withName: "//f1") as? SKSpriteNode
        f2 = childNode(withName: "//f2") as? SKSpriteNode
        f3 = childNode(withName: "//f3") as? SKSpriteNode
        
        p10.isHidden = true
        p20.isHidden = true
        p40.isHidden = true
        p70.isHidden = true
        p100.isHidden = true
        
        
        f0.isHidden = true
        f1.isHidden = true
        f2.isHidden = true
        f3.isHidden = true
//        p0?.removeFromParent()
//        p0.isHidden = false
        
//        p10?.position = CGPoint(x: size.width, y: size.height)
//        p20?.removeFromParent()
//        p40?.removeFromParent()
//        p70?.removeFromParent()
//        p100?.removeFromParent()
//        p0.isHidden = true
//        obs1 = SKSpriteNode(texture: SKTexture(imageNamed: "obs1.png"), color: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), size: CGSize(width: 50, height: 50))
//        obs2 = SKSpriteNode(texture: SKTexture(imageNamed: "obs2.png"), color: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), size: CGSize(width: 50, height: 50))
//        obs3 = SKSpriteNode(texture: SKTexture(imageNamed: "obs3.png"), color: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), size: CGSize(width: 50, height: 50))
//        obs4 = SKSpriteNode(texture: SKTexture(imageNamed: "obs4.png"), color: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), size: CGSize(width: 50, height: 50))
        
//        obs1.name = "obs1"
//
//        obs1.physicsBody = SKPhysicsBody(texture: obs1, size: obs1.size)
////                grape.physicsBody?.allowsRotation = false
//        obs1.physicsBody?.affectedByGravity = false
//        obs1.physicsBody?.categoryBitMask = 4
////        obs1.physicsBody?.collisionBitMask = 0x1 << 2
//        obs1.physicsBody?.contactTestBitMask = 0
//        obs1.position = CGPoint(x: 0, y: 0)
//        obs1.setScale(2)
//        obs1.physicsBody?.pinned = true
        
//        obs1.position = CGPoint(x: 0, y: 0)
        
        //UVA
        grape.fillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        grape.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        grape.name = "player"
        grape.physicsBody = SKPhysicsBody(circleOfRadius: grape.frame.size.width / 2)
//        grape.physicsBody?.allowsRotation = false
        grape.physicsBody?.affectedByGravity = false
        grape.physicsBody?.categoryBitMask = 0x1
        grape.physicsBody?.collisionBitMask = 0x1 << 2
        grape.physicsBody?.contactTestBitMask = 0x1 << 1 + 0x1 << 2
        
        
        
        //OBS1
        
//        self.addChild(obs1)
        
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.friction = 0
        self.physicsBody = borderBody
        
        
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        physicsWorld.contactDelegate = self
    }
    
    public override func sceneDidLoad() {
        
        playerMusic = SKAction.playSoundFileNamed("Playground.mpeg", waitForCompletion: true)
        let loopSound:SKAction = SKAction.repeatForever(playerMusic)
        self.run(loopSound)
//        playMusic()
        
        self.physicsWorld.contactDelegate = self
        let frameX = self.frame.size.width
        let frameY = self.frame.size.height
//        print(frameY, frameX)
        
        self.addChild(grape)
    
        
    }
    
    public func didBegin(_ contact: SKPhysicsContact) {

        let contatoFoiBatido:String! = contact.bodyA.node?.name as! String
        let contatoBateu:String! = contact.bodyA.node?.name as! String
        let grapeColor = grape.fillColor
        
        
//        let green = UIColor(red: 78, green: 43, blue: 123, alpha: 1)
//        let red = UIColor(red: 215, green: 54, blue: 58, alpha: 1)
        
        let green = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        let red = #colorLiteral(red: 0.917501688, green: 0.1016428694, blue: 0.1904039383, alpha: 1)
        let blue = #colorLiteral(red: 0.1725028455, green: 0.4885354638, blue: 0.7167468667, alpha: 1)
        let brown = #colorLiteral(red: 0.5926719308, green: 0.3622905016, blue: 0.1190401539, alpha: 1)
//        print(contatoFoiBatido)
        
        if(contatoFoiBatido == "RectangleYL"){
            self.grapeCopy.fillColor = green
            self.grapeCopy.strokeColor = green           
        }
        if(contatoFoiBatido == "RectangleRL"){
            
            self.grapeCopy.fillColor = red
            self.grapeCopy.strokeColor = red
        }
        if(contatoFoiBatido == "RectangleB"){
            
            self.grapeCopy.fillColor = blue
            self.grapeCopy.strokeColor = blue
        }
        if(contatoFoiBatido == "RectangleW"){
            
            self.grapeCopy.fillColor = brown
            self.grapeCopy.strokeColor = brown
            
        }
        if(contatoFoiBatido == "obs1" && grapeCopy.fillColor == blue){
            obs1C = true
            points += 1
        }
        if(contatoFoiBatido == "obs2" && grapeCopy.fillColor == red){
            obs2C = true
            points += 1
        }
        if(contatoFoiBatido == "obs3" && grapeCopy.fillColor == brown){
            obs3C = true
            points += 1
        }
        if(contatoFoiBatido == "obs4" && grapeCopy.fillColor == green){
            obs4C = true
            points += 1
        }
        
        
    }
    
    func touchDown(atPoint:CGPoint){
        if(atPoint.x > corner1.position.x && atPoint.x < corner1.position.y && atPoint.y > corner1.position.x && atPoint.y < corner1.position.y && Nterminou) {
//        addChild(grape)
        grape.isHidden = false
        
//        grape.position.x = atPoint.x
//        grape.position.x = atPoint.y
//        grape.isHidden = false
//        self.addChild(grape)
        x1 = atPoint.x
        y1 = atPoint.y
        }
    }
    
    func touchMoved(atPoint:CGPoint){
        
        let p = self.size.width / 8
//        print(p, atPoint.x)
//        print(atPoint.x > corner1.position.x , atPoint.x < corner1.position.y , atPoint.y > corner1.position.x , atPoint.y < corner1.position.y)
        
        
        if(atPoint.x > corner1.position.x && atPoint.x < corner1.position.y && atPoint.y > corner1.position.x && atPoint.y < corner1.position.y && Nterminou) {
            grape.position = atPoint
        }
        
    }
    func touchUp(atPoint:CGPoint){
        if(atPoint.x > corner1.position.x && atPoint.x < corner1.position.y && atPoint.y > corner1.position.x && atPoint.y < corner1.position.y && Nterminou) {
        bolasNum -= 1
        x2 = atPoint.x
        y2 = atPoint.y
        
        
//        print(fX)
//        grape.physicsBody?.applyImpulse(CGVector(dx: -fX, dy: -fY), at: atPoint)
            copia = true}
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
    
    var velocidadeAnterior:CGFloat?
    override public func update(_ currentTime: TimeInterval) {
        var posX:CGPoint;
        var a = Int.random(in: 0...2)
        if(obs1C){
            if(a == 0){
                posX = obs1.position
                obs1.position = obs2.position
                obs2.position = posX
                obs1C = false
            } else if (a==1){
                posX = obs1.position
                obs1.position = obs3.position
                obs3.position = posX
                obs1C = false
            } else {
                posX = obs1.position
                obs1.position = obs4.position
                obs4.position = posX
                obs1C = false
            }
            
        }
        if(obs2C){
            if(a == 0){
                posX = obs2.position
                obs2.position = obs3.position
                obs3.position = posX
                obs2C = false
            } else if (a==1){
                posX = obs2.position
                obs2.position = obs1.position
                obs1.position = posX
                obs2C = false
            } else{
                posX = obs2.position
                obs2.position = obs4.position
                obs4.position = posX
                obs2C = false
            }
            
        }
        if(obs3C){
            if(a == 0){
                posX = obs3.position
                obs3.position = obs4.position
                obs4.position = posX
                obs3C = false
            } else if (a==1){
                posX = obs3.position
                obs3.position = obs1.position
                obs1.position = posX
                obs3C = false
            } else{
                posX = obs3.position
                obs3.position = obs2.position
                obs2.position = posX
                obs3C = false
            }
            
        }
        if(obs4C){
            if(a == 0){
                posX = obs4.position
                obs4.position = obs1.position
                obs1.position = posX
                obs4C = false
            } else if (a==1){
                posX = obs4.position
                obs4.position = obs2.position
                obs2.position = posX
                obs4C = false
            } else{
                posX = obs4.position
                obs4.position = obs3.position
                obs3.position = posX
                obs4C = false
            }
            
        }
        
        if(copia){
            fX = (x2-x1) / 1
            fY = (y2-y1) / 1
            
            grapeCopy = grape.copy() as! SKShapeNode
//            print(grapeCopy)
            
            addChild(grapeCopy)
            grapeCopy.physicsBody?.applyForce(CGVector(dx: -fX * 20, dy: -fY * 20))
//            grape.position = CGPoint(x: 0, y: 0)

            grape.isHidden = true
//            grape.i
//             grape.removeFromParent()
//
//            
//            grape = grapeCopy.copy() as! SKShapeNode
//            grape.position = CGPoint(x: 0, y: 0)
            copia = false
//            grape.position = CGPoint(x: 0, y: 0)
        }
//        print(points)
        if(points > 0){
            p10.isHidden = false
        }
        if(points >= 2){
            p20.isHidden = false
        }
        if(points >= 4){
            p40.isHidden = false
        }
        if(points >= 7){
            p70.isHidden = false
        }
        if(points >= 10){
            p100.isHidden = false
        }
//        bolasFaltando.attributedText = bolasNum as! String
        bolasFaltando.text = String(bolasNum)
        
        if(bolasNum == -1 && Nterminou){
//            self.removeAllChildren()
//            self.removeChildren(in: grapeCopy)
            
//            removeChildren(gra)
            grape.removeFromParent()
//            grapeCopy.removeFromParent()
            Nterminou = false
            if(points < 3){
                
                f0.isHidden = false
//                grape.removeFromParent()
                
            }
            if(points >= 3 && points < 7){
                f1.isHidden = false
            }
            if(points >= 7 && points < 10){
                f2.isHidden = false
            }
            if(points >= 10){
                f3.isHidden = false
            }
            grapeCopy.removeFromParent()
        }
//        print(bolasFaltando.text)
    }
    

    public override func didChangeSize(_ oldSize: CGSize) {
        //resize
    }
    
    
    
}


