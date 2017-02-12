import UIKit

class PlayerNamesController: UIViewController {

    @IBOutlet weak var player1Label: UITextField!
    @IBOutlet weak var player2Label: UITextField!
    @IBOutlet weak var player3Label: UITextField!
    @IBOutlet weak var player4Label: UITextField!
    @IBOutlet weak var player5Label: UITextField!
    @IBOutlet weak var player6Label: UITextField!
    @IBOutlet weak var player7Label: UITextField!
    @IBOutlet weak var player8Label: UITextField!
    @IBOutlet weak var player9Label: UITextField!
    @IBOutlet weak var player10Label: UITextField!

    var playerLabels: [UITextField] = []
    var activePlayerLabels: [UITextField] = []

    @IBOutlet weak var playerNumText: UILabel!
    var numPlayers: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        playerLabels = [
            player1Label, player2Label, player3Label, player4Label, player5Label,
            player6Label, player7Label, player8Label, player9Label, player10Label,
        ]
        activePlayerLabels = [player1Label, player2Label]
        if numPlayers > 2 {
            for i in 2 ... numPlayers - 1 {
                playerLabels[i].isHidden = false
                playerLabels.append(playerLabels[i])
            }
        }
    }

    @IBAction func submitButtonPressed(_: AnyObject) {
        var fieldsFilled: Bool! = true
        for label in activePlayerLabels {
            if label.text == "" {
                fieldsFilled = false
            }
        }
        if !fieldsFilled {
            let alert = UIAlertController(title: "Error", message: "Please enter all names!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            // do stuff
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
