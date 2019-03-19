//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit


// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))



let scene = GameScene(size: sceneView.frame.size)
sceneView.presentScene(scene)

scene.scaleMode = .resizeFill

scene.backgroundColor = UIColor.white
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView



//if let scene = GameScene(fileNamed: "GameScene") {
//    // Set the scale mode to scale to fit the window
//    scene.scaleMode = .aspectFill
//
//    // Present the scene
//    sceneView.presentScene(scene)
//}

//PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
