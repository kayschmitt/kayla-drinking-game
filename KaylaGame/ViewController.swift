//
//  ViewController.swift
//  KaylaGame
//
//  Created by Kayla Schmitt on 12/4/16.
//  Copyright © 2016 Kayla Schmitt. All rights reserved.
//

import UIKit

struct Player {
    var name = ""
    var score = 0
}

class ViewController: UIViewController {

    @IBOutlet weak var playerNum: UILabel!

    @IBOutlet weak var newL: UILabel!
    var allPlayers: [Player] = []
    var numPlayers: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        allPlayers.append(Player(name: "Kayla", score: 0))

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        playerNum.text = Int(sender.value).description
        numPlayers = Int(sender.value)
    }

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "segue_PlayerNamesController" {
            let vc = segue.destination as! PlayerNamesController
            vc.numPlayers = numPlayers
        }
    }
}
