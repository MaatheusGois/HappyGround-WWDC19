import Foundation
import SpriteKit

public class Player: SKNode {
    init(Image: SKSpriteNode){
        super.init()
        self.name = "player"
        self.physicsBody = SKPhysicsBody(circleOfRadius: Image.size.width/2)
        self.physicsBody?.affectedByGravity = false
        self.addChild(Image)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("No support")
    }
}

