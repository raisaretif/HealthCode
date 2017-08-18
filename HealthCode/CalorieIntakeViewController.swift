import UIKit

class CalorieIntakeViewController: UIViewController {

    ////// IBOUtlets ////////////
    @IBOutlet var normalCalorieIntakeLabel: UILabel!
    @IBOutlet var changeCalorieIntakeLabel: UILabel!
    @IBOutlet var toHaveNormalBMICalorieLabel: UILabel!
    @IBOutlet var perDayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.instance.CalorieResults = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setCaloriesLabels(calorieIntakeDato: Double, changeCalorieIntakeParaLabel: Double){
        toHaveNormalBMICalorieLabel.text = " "
        changeCalorieIntakeLabel.text = " "
        perDayLabel.text = " "
        normalCalorieIntakeLabel.text = String(calorieIntakeDato) + " KCAL"
        if changeCalorieIntakeParaLabel > 0
        {
            toHaveNormalBMICalorieLabel.text = "To have a normal BMI"
            perDayLabel.text = "per Day"
            changeCalorieIntakeLabel.text = String(changeCalorieIntakeParaLabel) + " KCAL"
        }
        else if changeCalorieIntakeParaLabel <= 0
        {
            toHaveNormalBMICalorieLabel.text = "You don't need to gain or lose weight"
            changeCalorieIntakeLabel.text = " "
            perDayLabel.text = " "
        }
    }
}

