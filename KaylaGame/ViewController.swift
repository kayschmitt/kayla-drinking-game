import UIKit

struct Player {
    var name = ""
    var score = 0
}

struct Materials {
    var name = ""
    var isSelected = false

    init(nameInput: String) {
        name = nameInput
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var playerNum: UILabel!
    @IBOutlet var tableView: UITableView!

    @IBOutlet weak var newL: UILabel!
    var numPlayers: Int = 0
    var materials: [Materials] = [Materials.init(nameInput: "Dice"), Materials.init(nameInput: "Cards"), Materials.init(nameInput: "Cups")]
    var checkedMaterials: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.allowsMultipleSelection = true
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
            vc.materials = materials
        }
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return materials.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = materials[indexPath.row].name
        // cell.accessoryType = cell.isSelected ? .checkmark : .none
        cell.selectionStyle = .none // to prevent cells from being "highlighted"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            cell.accessoryType = .checkmark
            materials[indexPath.row].isSelected = true
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            cell.accessoryType = .none
            materials[indexPath.row].isSelected = false
        }
    }
}
