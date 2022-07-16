//
//  ViewController.swift
//  diceGame
//
//  Created by 羅以捷 on 2022/6/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        result.text = "Start Play"
        result.layer.borderWidth = 2
        result.layer.borderColor = UIColor.darkGray.cgColor
        result.layer.cornerRadius = 20
    }
    let diceName = ["one", "two", "three", "four", "five", "six"]
    var diceNumberA = 0
    var diceNumberB = 0
    var sumA = 0
    var sumB = 0
    @IBOutlet var diceA: [UIImageView]!
    @IBOutlet var diceB: [UIImageView]!
    @IBOutlet weak var result: UILabel!
    func windice(){
        if sumA > sumB {
            result.text = "PlayerA \(sumA) 點 > PlayerB \(sumB) 點，PlayerA Win"
        } else if sumB > sumA {
            result.text = "PlayerA \(sumA) 點 < PlayerB \(sumB) 點，PlayerB Win"
        } else {
            result.text = "PlayerA \(sumA) 點 = PlayerB \(sumB) 點，平手"
        }
    }
    
    @IBAction func playerAdice(_ sender: Any) {
        if sumB == 0 {
            if sumA != 0, sumB == 0 {
                result.text = "PlayerA \(sumA) 點，請PlayerB 擲骰"
            } else {
                for dice in diceA{
                    diceNumberA = Int.random(in: 0...5)
                    dice.image = UIImage(named: diceName[diceNumberA])
                    diceNumberA = diceNumberA + 1
                    sumA = sumA + diceNumberA
                }
                result.text = "PlayerA \(sumA) 點，請PlayerB 擲骰"
            }
        } else if sumB != 0, sumA == 0{
            for dice in diceA{
                diceNumberA = Int.random(in: 0...5)
                dice.image = UIImage(named: diceName[diceNumberA])
                diceNumberA = diceNumberA + 1
                sumA = sumA + diceNumberA
            }
            windice()
        } else if sumA != 0, sumB != 0{
            result.text = "請按replay重新開始玩"
        }
    }
    
    @IBAction func playerBdice(_ sender: Any) {
        if sumA == 0 {
            if sumB != 0, sumA == 0 {
                result.text = "PlayerB \(sumB)點，請PlayerA 擲骰"
            } else {
                for dice in diceB{
                    diceNumberB = Int.random(in: 0...5)
                    dice.image = UIImage(named: diceName[diceNumberB])
                    diceNumberB = diceNumberB + 1
                    sumB = sumB + diceNumberB
                }
                result.text = "PlayerB \(sumB)點，請PlayerA 擲骰"
            }
        } else if sumA != 0, sumB == 0{
            for dice in diceB{
                diceNumberB = Int.random(in: 0...5)
                dice.image = UIImage(named: diceName[diceNumberB])
                diceNumberB = diceNumberB + 1
                sumB = sumB + diceNumberB
            }
            windice()
        } else if sumA != 0, sumB != 0{
            result.text = "請按replay重新開始玩"
        }

    }
    @IBAction func replay(_ sender: Any) {
        result.text = "請擲骰"
        sumA = 0
        sumB = 0
        diceNumberA = 0
        diceNumberB = 0
        for dice in diceA {
            dice.image = UIImage(named: diceName[0])
        }
        for dice in diceB {
            dice.image = UIImage(named: diceName[0])
        }
    }
    

}

