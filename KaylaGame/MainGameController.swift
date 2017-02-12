import UIKit

extension String {
    func format(parameters: CVarArg...) -> String {
        return String(format: self, arguments: parameters)
    }
}

class MainGameController: UIViewController {
    @IBOutlet weak var questionText: UILabel!
    var players: [PlayerInfo]!
    var questions: [String]! = ["%@ must take two drinks."]
    var numPlayers: Int!
    var materials: [Materials]!

    override func viewDidLoad() {
        super.viewDidLoad()
        numPlayers = players.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func nextButtonPressed(_: AnyObject) {
        let randomNum: Int = Int(arc4random_uniform(UInt32(numPlayers)))
        print(numPlayers)
        print(randomNum)
        let message = questions[0].format(parameters: players[randomNum].name)
        questionText.text = message
    }
}
