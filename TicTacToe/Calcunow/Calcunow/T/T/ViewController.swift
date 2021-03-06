//
//  ViewController.swift
//  T
//
//  Created by Naresh Kumar on 2021-07-28.
//

import UIKit

class ViewController: UIViewController
{
    var activePlayer=1
    var gameState=[0,0,0,0,0,0,0,0,0]
    let wincombo=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gActive=true
    @IBOutlet weak var label: UILabel!
    @IBAction func action(_ sender: AnyObject)
    {
        if (gameState[sender.tag-1]==0 && gActive==true)
        {
            gameState[sender.tag-1]=activePlayer
            if (activePlayer==1)
            {
                sender.setImage(UIImage(named:"x.png"), for: UIControl.State())
                activePlayer=2
            }
            else
            {
                sender.setImage(UIImage(named:"o.png"), for: UIControl.State())
                activePlayer=1
            }
        }
            for co in wincombo
            {
                if (gameState[co[0]] != 0) && gameState[co[0]]==gameState[co[1]] && gameState[co[1]]==gameState[co[2]]{
                    
                
                    gActive=false
                    if gameState[co[0]]==1
                    {
                        label.text="X HAS WON!"
                    }
                    else
                    {
                        label.text="O HAS WON!"
                    }
                    playAgainBut.isHidden=false
                    label.isHidden=false
                }
            }
        var count=1
        if gActive==true{
            for i in gameState{
                count=i*count
            }
            if (count != 0){
            label.text="IT WAS A TIE"
            label.isHidden=false
            playAgainBut.isHidden=false
            }
        }
        }
        
    @IBOutlet weak var playAgainBut: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        gameState=[0,0,0,0,0,0,0,0,0]
        gActive=true
        activePlayer=1
        playAgainBut.isHidden=true
        label.isHidden=true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
}
