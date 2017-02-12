import UIKit

extension String {
    func format(parameters: CVarArg...) -> String {
        return String(format: self, arguments: parameters)
    }
}

class MainGameController: UIViewController {
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var playerTurnText: UILabel!
    var players: [PlayerInfo]!
    var allPrompts: [String]! = []
    var basicPrompts: [String]! = [
        "Give out two drinks.",
        "SOCIAL! Everyone drink!",
        "Take 2 drinks.",
        "Ask %@ any quesetion you want. If they are able to answer it honestly, take a drink. If not, %@ has to take 3.",
        "Waterfall! You start.",
        "Never have I ever! Start with 5 fingers. First person to put down all 5 fingers has to take 3 drinks. The person with the most fingers up at the end has to take 2.",
        "If you have shared an intimate moment with %@, take 3 drinks.",
    ]
    var dicePrompts: [String]! = [
        "Roll the dice. Give out the number of drinks you roll.",
        "Ask %@ to pick a number 1-6. If you don't roll the right number, take 2 drinks. If you do, %@ has to take 4.",
        "You and %@ both roll the dice. Whoever rolls highest has to take 2 drinks. If it's a tie, you both take 3.",
        "Go around in a circle rolling the dice. The first person to roll a 6 calls out the number of drinks. The second person has to drink that many. You start!",
        "Roll the dice. Chug your drink for the amount of seconds you roll.",
    ]
    var cardPrompts: [String]! = [
        "Black or Red? Pick one and flip over a card. If you're right, give out 3 drinks. If you're wrong, take 4.",
        "Pick a card and don't let anyone see it! Ask %@ to guess the suite. If they get it right, drink 4. If they get it wrong, %@ has to take 2.",
    ]
    var cupPrompts: [String]! = ["Go up against %@ in a round of flip cup. Loser takes 3 drinks."]

    var numPlayers: Int!
    var playerTurn: Int = 0
    var numPrompts: Int!
    var materials: [Materials]!

    override func viewDidLoad() {
        super.viewDidLoad()
        numPlayers = players.count
        getPrompts()
        nextQuestion(turn: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func nextButtonPressed(_: AnyObject) {
        if playerTurn == numPlayers - 1 {
            playerTurn = 0
        } else {
            playerTurn += 1
        }
        nextQuestion(turn: playerTurn)
    }

    func getPrompts() {
        allPrompts.append(contentsOf: basicPrompts)
        if materials[0].isSelected == true {
            allPrompts.append(contentsOf: dicePrompts)
        }
        if materials[1].isSelected == true {
            allPrompts.append(contentsOf: cardPrompts)
        }
        if materials[2].isSelected == true {
            allPrompts.append(contentsOf: cupPrompts)
        }
        numPrompts = allPrompts.count
    }

    func nextQuestion(turn: Int) {
        setTurnText()
        let activePlayer = turn
        var randomPlayerNum2: Int = Int(arc4random_uniform(UInt32(numPlayers)))
        while activePlayer == randomPlayerNum2 {
            randomPlayerNum2 = Int(arc4random_uniform(UInt32(numPlayers)))
        }
        let randomQuestionNum: Int = Int(arc4random_uniform(UInt32(numPrompts)))
        let message = allPrompts[randomQuestionNum].format(parameters: players[randomPlayerNum2].name, players[randomPlayerNum2].name)
        questionText.text = message
    }

    func setTurnText() {
        playerTurnText.text = "It's " + players[playerTurn].name + "'s turn!"
    }
}
