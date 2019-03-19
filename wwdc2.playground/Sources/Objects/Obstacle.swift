import Foundation
import SpriteKit


public class Obstacle: SKShapeNode {
    init(Image: SKSpriteNode, imageName:String) {
        super.init()
        self.name = "obstacle"
        self.setScale(0.5)
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: imageName), size: Image.size)
        self.physicsBody?.affectedByGravity = false
        self.addChild(Image)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
