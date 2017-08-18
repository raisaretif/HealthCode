import UIKit

class BMIViewController: UIViewController {
    
    ////////// IBOutlets ////////////////////
    @IBOutlet var BMIDataLabel: UILabel!
    @IBOutlet var BMICategoryLabel: UILabel!
    @IBOutlet var loseOrGainWeightLabel: UILabel!
    @IBOutlet var changeWeightLabel: UILabel!

    enum BMICategories: Double {
        case underweight = 18.5
        case normal = 24.9
        case overweight = 29.9
        case obese = 30
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.instance.BMIResults = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setLabels(BMIData: Double, heightCentimeters: Double, weightDato: Double){
        changeWeightLabel.text = " "
        loseOrGainWeightLabel.text = " "
        let BMIDataDecimals = Double(round(1000*BMIData)/1000)
        BMIDataLabel.text = String(BMIDataDecimals)
        var changeWeight: Bool
        changeWeight = false;
        if BMIData < BMICategories.underweight.rawValue{
            BMICategoryLabel.text = "Underweight"
            changeWeight = true
        }
        else if BMIData < BMICategories.normal.rawValue{
            BMICategoryLabel.text = "Normal"
            changeWeight = false
        }
        else if BMIData < BMICategories.overweight.rawValue{
            BMICategoryLabel.text = "Overweight"
            changeWeight = true
        }
        else if BMIData >= BMICategories.obese.rawValue{
            BMICategoryLabel.text = "Obese"
            changeWeight = true
        }
        
        if changeWeight == true
        {
            let newWeight = 24.9 * (heightCentimeters*heightCentimeters)
            if newWeight < weightDato
            {
                loseOrGainWeightLabel.text = "You have to lose: "
                let gainLose = weightDato - newWeight
                let gainLoseDecimals = Double(round(1000*gainLose)/1000)
                changeWeightLabel.text = String(gainLoseDecimals) + " kg"
                let gainLoseCalorie = "lose"
                Model.instance.addChangeCalorieIntake(gainLoseCalorie: gainLoseCalorie)
            }
            else if newWeight > weightDato
            {
                loseOrGainWeightLabel.text = "You have to gain: "
                let gainLose = newWeight - weightDato
                let gainLoseDecimals = Double(round(1000*gainLose)/1000)
                changeWeightLabel.text = String(gainLoseDecimals) + " kg"
                let gainLoseCalorie = "gain"
                Model.instance.addChangeCalorieIntake(gainLoseCalorie: gainLoseCalorie)
            }
        }
    }
}
