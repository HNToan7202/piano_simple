//
//  GameScene.swift
//  PianoSimple
//
//  Created by Nguyen Hoang Toan on 08/02/2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var KeyBoard:[SKShapeNode] = []
    var Points: [CGPoint] = []
    override func didMove(to view: SKView) {
        create_white_keyboard()
        create_Black_Keyboard()
    }
    func create_white_keyboard(){
        var x : CGFloat = -self.size.width/2 + self.size.width/10/2
        
        for i in 0...9 {
            let white = SKShapeNode(rectOf: CGSize(width: self.size.width/10, height:self.size.width/3))
            white.name = String(i)
            white.position = CGPoint(x: x , y: 0)
            white.fillColor = .white
            white.strokeColor = .black
            white.lineWidth = 4
            x += self.size.width/10
            KeyBoard.append(white)
            addChild(KeyBoard[KeyBoard.count-1])
        }
    }
    
    func create_Black_Keyboard(){
    
        Points = [CGPoint](repeating: CGPoint(x: 0, y: 0), count: 10)
        
        let pos0 = CGPoint(x: KeyBoard[0].position.x + self.size.width/10/2,y: 55)
        let pos1 = CGPoint(x: KeyBoard[1].position.x + self.size.width/10/2,y: 55)
        let pos3 = CGPoint(x: KeyBoard[3].position.x + self.size.width/10/2,y: 55)
        let pos4 = CGPoint(x: KeyBoard[4].position.x + self.size.width/10/2,y: 55)
        let pos5 = CGPoint(x: KeyBoard[5].position.x + self.size.width/10/2,y: 55)
        let pos7 = CGPoint(x: KeyBoard[7].position.x + self.size.width/10/2,y: 55)
        let pos8 = CGPoint(x: KeyBoard[8].position.x + self.size.width/10/2,y: 55)
        
        Points.append(pos0)
        Points.append(pos1)
        Points.append(pos3)
        Points.append(pos4)
        Points.append(pos5)
        Points.append(pos7)
        Points.append(pos8)


        for i in 10...16 {
            
            let black = SKShapeNode(rectOf: CGSize(width: self.size.width/15, height: size.width/4))
            black.position = Points[i]
            black.name = String(i)
            black.fillColor = .black
            black.strokeColor = .black
            KeyBoard.append(black)
            addChild(KeyBoard[KeyBoard.count - 1])
            
        }
    }
    func sound(i:String){
        switch i {
        case "0" :
            self.run(SKAction.playSoundFileNamed("4C", waitForCompletion: false))
        case "1" :
            self.run(SKAction.playSoundFileNamed("4D", waitForCompletion: false))
        case "2" :
            self.run(SKAction.playSoundFileNamed("4E", waitForCompletion: false))
        case "3" :
            self.run(SKAction.playSoundFileNamed("4F", waitForCompletion: false))
        case "4" :
            self.run(SKAction.playSoundFileNamed("4G", waitForCompletion: false))
        case "5" :
            self.run(SKAction.playSoundFileNamed("4A", waitForCompletion: false))
        case "6" :
            self.run(SKAction.playSoundFileNamed("4B", waitForCompletion: false))
        case "7" :
            self.run(SKAction.playSoundFileNamed("5C", waitForCompletion: false))
        case "8" :
            self.run(SKAction.playSoundFileNamed("5D", waitForCompletion: false))
        case "9" :
            self.run(SKAction.playSoundFileNamed("5E", waitForCompletion: false))
        case "10" :
            self.run(SKAction.playSoundFileNamed("4Cs", waitForCompletion: false))
        case "11" :
            self.run(SKAction.playSoundFileNamed("4Ds", waitForCompletion: false))
        case "12" :
            self.run(SKAction.playSoundFileNamed("4Fs", waitForCompletion: false))
        case "13" :
            self.run(SKAction.playSoundFileNamed("4Gs", waitForCompletion: false))
        case "14" :
            self.run(SKAction.playSoundFileNamed("5Cs", waitForCompletion: false))
        case "15" :
            self.run(SKAction.playSoundFileNamed("5Ds", waitForCompletion: false))
        case "16" :
            self.run(SKAction.playSoundFileNamed("5Gs", waitForCompletion: false))
        default :
            break
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        for i in 0...16 {
            if atPoint(location).name == String(i){
                sound(i: String(i))
            }
        }
    }
}
