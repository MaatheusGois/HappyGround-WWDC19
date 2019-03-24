//#-hidden-code

import PlaygroundSupport
import SpriteKit

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))



if let scene = GameScenePage2(fileNamed: "GameScenePage2") {
    scene.scaleMode = .aspectFill
    sceneView.presentScene(scene)
}
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
//#-end-hidden-code

/*:
 ### The Game
 
 Have fun and enjoy the music!
 */
