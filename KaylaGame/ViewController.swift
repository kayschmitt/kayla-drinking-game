import UIKit

struct Player {
    var name = ""
    var score = 0
}

class ViewController: UIViewController {

    @IBOutlet weak var playerNum: UILabel!

    @IBOutlet weak var newL: UILabel!
    var numPlayers: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
