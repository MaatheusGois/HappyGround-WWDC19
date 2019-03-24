import Foundation
import PlaygroundSupport
import SpriteKit
import UIKit
import AVFoundation


public class GameScenePage1 : SKScene , SKPhysicsContactDelegate{
    
    var playerMusic:SKAction!
    
    let frameX = 0.0
    let frameY = 0.0
//    var radiuus: CGFloat! = 20
    var grape: SKShapeNode = SKShapeNode(circleOfRadius: 10)
    var corner1:SKSpriteNode!
    var corner2:SKSpriteNode!
    var corner3:SKSpriteNode!
    var corner4:SKSpriteNode!

    var bar1:SKSpriteNode!
    var bar2:SKSpriteNode!
    var bar3:SKSpriteNode!
    var bar4:SKSpriteNode!

    var nextGame:SKSpriteNode!

    var obs1:SKSpriteNode!
    var obs2:SKSpriteNode!
    var obs3:SKSpriteNode!
    var obs4:SKSpriteNode!
    var mao:SKSpriteNode!
    
    var goal : SKSpriteNode!
    
    var count = 100
    var notMoved = true
    
    var x1:CGFloat = 0
    var x2:CGFloat = 0
    var y1:CGFloat = 0
    var y2:CGFloat = 0
    
    var fX:CGFloat = 0
    var fY:CGFloat = 0
    
    var color = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    
    var novaCor:UIColor!

    
    public override func didMove(to view: SKView) {

        obs3 = childNode(withName: "//obs3") as? SKSpriteNode
//        obs4 = childNode(withName: "//obs4") as? SKSpriteNode
        nextGame = childNode(withName: "//nextGame") as? SKSpriteNode
        
        nextGame.isHidden = true
        //Mao
        mao = SKSpriteNode(imageNamed: "mao")
        mao = SKSpriteNode(texture: SKTexture(imageNamed: "mao.png"), color: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), size: CGSize(width: size.width / 6, height: size.width / 3))
        
        
        
        
        
        //UVA
        grape.fillColor = #colorLiteral(red: 0.5926719308, green: 0.3622905016, blue: 0.1190401539, alpha: 1)
        grape.strokeColor = #colorLiteral(red: 0.5926719308, green: 0.3622905016, blue: 0.1190401539, alpha: 1)
        grape.name = "player"
        grape.physicsBody = SKPhysicsBody(circleOfRadius: grape.frame.size.width / 2)
//        grape.physicsBody?.allowsRotation = false
        grape.physicsBody?.affectedByGravity = false
        grape.physicsBody?.categoryBitMask = 0x1
        grape.physicsBody?.collisionBitMask = 0x1 << 2
        grape.physicsBody?.contactTestBitMask = 0x1 << 1 + 0x1 << 2
//        grape.size = CGSize(width: size.width / 10, height: size.width / 10)
        
        
//        print(displaySize)
        if size.height > size.width {
            mao.position = CGPoint(x: 0, y: -(size.height / 5.4))
            obs3.position = CGPoint(x: 0, y: (size.height / 4))
//            mao.size = CGPoint(x: size.width / 10, y: Int)
            
        } else{
            mao.position = CGPoint(x: -(size.width / 4), y: -(size.width / 8))
            obs3.position = CGPoint(x: (size.width / 4), y: 0)
        }
        nextGame.position = CGPoint(x: 0, y: 0)

        
        
        grape.isHidden = true
        //OBS1
        
//        self.addChild(obs1)
        
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.friction = 0
        self.physicsBody = borderBody
        
        self.addChild(mao)

        
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
        print(contatoFoiBatido)
        
        
        if(contatoFoiBatido == "obs3"){
            nextGame.size = CGSize(width: size.width / 3 + size.width / 6, height: size.width / 3)
            grape.removeFromParent()
//            grape.isHidden = true
//            addChild(grape)
            
//            let otherWait = SKAction.waitForDuration(1)
//            let otherSequence = SKAction.sequence([otherWait, SKAction.repeatActionForever(sequence)])
//            runAction(otherSequence)
            
            
            obs3.isHidden = true
            nextGame.isHidden = false    
        }
//        grape.fillColor = red.add2(color1: grape.fillColor, color2: green)
        
//        grape.fillColor = green
        
//        print(grape.fillColor)
//        print(red, green)
//        print(red.add2(color1: red, color2: green))
//        add2(red, with: green)
        
        
        
    }
    
    func touchDown(atPoint:CGPoint){
        
        grape.position.x = atPoint.x
        grape.position.y = atPoint.y

        x1 = grape.position.x
        y1 = grape.position.y
        
        mao.isHidden = true
        grape.isHidden = false

        
    }
    
    func touchMoved(atPoint:CGPoint){
        
        
        
        
        let p = self.size.width / 8
//        print(p, atPoint.x)
        
        if(atPoint.x <= p + (self.size.width / 2)) {
            grape.position = atPoint
        }
        
    }
    
    func touchUp(atPoint:CGPoint){
        
        x2 = grape.position.x
        y2 = grape.position.y
        
        fX = (x2-x1) / 2
        fY = (y2-y1) / 2
//        print(fX)
        
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
    
//    var velocidadeAnterior:CGFloat?
    override public func update(_ currentTime: TimeInterval) {
        
        if(count>0){
            if size.height > size.width {
                print("ALTURA")
                mao.position.y -= 0.3
                count -= 1
                if(count <= 0 && notMoved){
                    count = 100
                    mao.position.y = -(size.height / 5.4)
                }
            } else{
                mao.position.x -= 0.3
                count -= 1
                if(count <= 0 && notMoved){
                    count = 100
                    mao.position.x = -(size.width / 5.4)
                }
            }
        }
        
        
//        if grape.physicsBody!.velocity.dx > -30 && grape.physicsBody!.velocity.dx < 30 ||
//            grape.physicsBody!.velocity.dy > -30 && grape.physicsBody!.velocity.dy < 30
//
//        {
//            grape.position = CGPoint(x:0, y:0)
//        }
//        velocidadeAnterior = grape.physicsBody?.velocity.dx
    }
    
    
    public override func didChangeSize(_ oldSize: CGSize) {
        //resize
        if size.height > size.width {
            mao.position = CGPoint(x: 0, y: -(size.height / 5.4))
            obs3.position = CGPoint(x: 0, y: (size.height / 4))
            //            mao.size = CGPoint(x: size.width / 10, y: Int)

        } else{
            
        }


    }
//
//    func resizeObjByWidth(obj:SKSpriteNode, new_width:CGFloat){
//        let w_old = obj.size.width
//        let h_old = obj.size.height
//        let w_new = new_width
//        let h_new = w_new * h_old/w_old
//        obj.size = CGSize(width: w_new, height: h_new)
//    }
//
//    func resizeObjByHeight(obj:SKSpriteNode, new_height:CGFloat){
//        let w_old = obj.size.width
//        let h_old = obj.size.height
//        let h_new = new_height
//        let w_new = h_new * w_old/h_old
//        obj.size = CGSize(width: w_new, height: h_new)
//    }
    
//    @objc public func playMusic(){
//        let path = Bundle.main.path(forResource: "main_music.wav", ofType: nil)!
//
//        let url = URL(fileURLWithPath: path)
//        do{
//            playerMusic = try AVAudioPlayer(contentsOf: url)
//            playerMusic?.play()
//        } catch {
//            print("Error")
//        }
//    }
//
//    func waitEnd(forDuration duration: TimeInterval){
//        grape.isHidden = true
//        obs3.isHidden = true
//        nextGame.isHidden = false
//    }
    
}
