//
//  EnterPlayersController.swift
//  KaylaGame
//
//  Created by Kayla Schmitt on 2/4/17.
//  Copyright © 2017 Kayla Schmitt. All rights reserved.
//

import UIKit

class EnterPlayersController: UIViewController {

    var mainView = ViewController()

    @IBOutlet weak var playersNum: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        playersNum.text = String(mainView.numPlayers)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
