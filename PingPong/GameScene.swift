//
//  GameScene.swift
//  PingPong
//
//  Created by Salvatore  Polito on 08/11/16.
//  Copyright © 2016 Salvatore  Polito. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
     var pallina = SKSpriteNode()
     var enemy = SKSpriteNode()
     var main = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        //Lego le variabili del codice agli SpriteNode che ho creato
        
        pallina = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        main = self.childNode(withName: "main") as! SKSpriteNode
        
        
        //Il gioco inizia con un lancio della pallina
        pallina.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        
        
        //Creo la fisica del frame della finestra
        //Il comportamento voluto è che la pallina rimbalzi al contatto col frame
        let gameFrame = SKPhysicsBody(edgeLoopFrom: self.frame)
        gameFrame.friction = 0
        gameFrame.restitution = 1
        
        
        //Assegno la fisica creata al frame reale
        self.physicsBody = gameFrame

    }
        
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }

    }
    

    
    
    override func update(_ currentTime: TimeInterval) {
        
        enemy.run(SKAction.moveTo(x: pallina.position.x, duration: 1))
    }
}
