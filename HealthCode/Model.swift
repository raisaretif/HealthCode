import UIKit

final class Model: NSObject
{
    static let instance = Model()
    var BMIResults: BMIViewController?
    var CalorieResults: CalorieIntakeViewController?
    public var changeCalorieDato: Double = 0.0

    override init()
    {
        super.init()
    }
 
    func addBMI(BMIData: Double, heightCentimeters: Double, weightDato: Double)
    {
        BMIResults!.setLabels(BMIData: BMIData, heightCentimeters: heightCentimeters, weightDato: weightDato)
    
    }
    
    func addChangeCalorieIntake(gainLoseCalorie: String)
    {
        if gainLoseCalorie == "lose"
        {
            changeCalorieDato = 0.8
        }
        else if gainLoseCalorie == "gain"
        {
            changeCalorieDato = 1.2
        }
    }
    
    func addCalorieIntake(calorieIntakeDato: Double)
    {
        let changeCalorieIntakeDatoParaLabel = calorieIntakeDato*changeCalorieDato
        CalorieResults?.setCaloriesLabels(calorieIntakeDato: calorieIntakeDato, changeCalorieIntakeParaLabel: changeCalorieIntakeDatoParaLabel)
    }
}
