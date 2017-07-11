
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var farm: UILabel!
    @IBOutlet weak var cave: UILabel!
    @IBOutlet weak var house: UILabel!
    @IBOutlet weak var casino: UILabel!
    @IBOutlet weak var scorez: UILabel!
    
   var g_score = 0
    
    //    let ninja = NinjaGold()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scorez.text = String(g_score)
        print("current score is \(g_score)")
        farm.isHidden = true
        house.isHidden = true
        casino.isHidden = true
        cave.isHidden = true
        
    }
    @IBAction func buildingButtonPressed(_ sender: UIButton) {
        print(sender.tag)
        if sender.tag == 1{
            let gold = Int(arc4random_uniform(10) + 10)
            print(gold)
            addGold(golds: gold)
            farm.text = "Won \(gold) from farm!!"
            farm.isHidden = false
            house.isHidden = true
            casino.isHidden = true
            cave.isHidden = true
            
            
        }
        if sender.tag == 2{
            let gold = Int(arc4random_uniform(5) + 5)
            print(gold)
            addGold(golds: gold)
            cave.text = "Won \(gold) from cave!!"
            farm.isHidden = true
            house.isHidden = true
            casino.isHidden = true
            cave.isHidden = false
            
        }
        if sender.tag == 3{
            let gold = Int(arc4random_uniform(3) + 2)
            print(gold)
            addGold(golds: gold)
            house.text = "Won \(gold) from house!!"
            farm.isHidden = true
            house.isHidden = false
            casino.isHidden = true
            cave.isHidden = true
        }
        if sender.tag == 4{
            let gold = Int(arc4random_uniform(50) + 0)
            let chance = Int(arc4random_uniform(2))
            if chance == 1 {
                g_score -= gold
                casino.text = "Lost \(gold) from casino )-:"
            } else {
                addGold(golds: gold)
                casino.text = "Won \(gold) from casino!!"
            }
            print(gold)
            
            farm.isHidden = true
            house.isHidden = true
            casino.isHidden = false
            cave.isHidden = true
        }
        else if sender.tag == 5{
            reset()
        }
    }
    func reset(){
        g_score = 0
        farm.isHidden = true
        house.isHidden = true
        casino.isHidden = true
        cave.isHidden = true
        scorez.text = String(g_score)
    }
    
    func addGold(golds: Int){
        
        g_score += golds
        print("added \(golds) to  \(g_score) ")
        scorez.text = String(g_score)
    }
    
    
    
}
