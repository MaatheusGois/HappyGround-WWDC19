//#-hidden-code
import PlaygroundSupport
import SpriteKit

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
if let scene = GameScenePage1(fileNamed: "GameScenePage1") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    scene.size = sceneView.bounds.size
    sceneView.presentScene(scene)
}
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
//#-end-hidden-code

/*:
 ### HappyGround
 
 Historically, it was believed that babies did not have this ability. The use of nonverbal tasks has allowed researchers to challenge and refute this assumption. Declarative memory is apparent in the first year of life, demonstrated by tasks based on behavioral or non-verbal imitation.
 Thinking about a game that amuses and at the same time teaches spatial logic, HappyGround was developed.
 

 
 From Run to practice a little =D,  To take full advantage of the full screen user.

 */



