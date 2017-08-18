import UIKit

class ProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{

    @IBOutlet var picker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    ////////// IBOutlets ////////////////////
    @IBOutlet var nameTextfield: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var genderTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    public var activity: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for vc in (tabBarController?.viewControllers)! {
            _ = vc.view
        }
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        // Input data into the Picker Data Array:
        pickerData = ["Sedentary", "Lightweight (1 to 3 p/week)", "Moderate (3 to 5 p/week)", "Intense (6 to 7 p/week)", "High (Athletes)"]
    }
    
    ////////// IBActions ////////////////////
    @IBAction func saveButton(_ sender: Any) {
        guard let nameDato = nameTextfield.text, let ageDato = ageTextField.text, let genderDato = genderTextField.text, let weightDato = weightTextField.text, let heightDato = heightTextField.text else
        {
            return
        }
        print(nameDato)
        setBMI(weightDato: weightDato, heightDato: heightDato)
        setCaloreIntake(weightDato: weightDato, heightDato: heightDato, genderDato: genderDato, ageDato: ageDato)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ////////// PICKER DATA ////////////////////
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSForegroundColorAttributeName:UIColor.purple])
        return myTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activity = row
    }
    
    func setBMI(weightDato: String, heightDato: String){
        let heightDatoDouble = Double(heightDato)!
        let heightCentimeters = (heightDatoDouble/100)
        let BMIData = (Double(weightDato))!/(heightCentimeters*heightCentimeters)
        Model.instance.addBMI(BMIData: BMIData, heightCentimeters: heightCentimeters, weightDato: Double(weightDato)!)
    }
    
    func setCaloreIntake(weightDato: String, heightDato: String, genderDato: String, ageDato: String){
        //Set activity Dato
        var activityDato: Double = 0.0
        if activity == 0
        {
            activityDato = 1.2
        }
        else if activity == 1
        {
            activityDato = 1.375
        }
        else if activity == 2
        {
            activityDato = 1.55
        }
        else if activity == 3
        {
            activityDato = 1.725
        }
        else if activity == 4
        {
            activityDato = 1.9
        }
 
        //Set Calorie Intake
        if genderDato == "f"
        {
            let calorieIntakeUno = 655 + (9.6 * Double(weightDato)!)
            let calorieIntakeDos = 1.8 * Double(heightDato)!
            let calorieIntakeTres = 4.7 * Double(ageDato)!
            let calorieIntakeCuatro = calorieIntakeUno + (calorieIntakeDos - calorieIntakeTres)
            let calorieIntakeDato = calorieIntakeCuatro * activityDato
            Model.instance.addCalorieIntake(calorieIntakeDato: calorieIntakeDato)
        }
        else if genderDato == "m"
        {
            let calorieIntakeUno = 66 + (13.7 * Double(weightDato)!)
            let calorieIntakeDos = 5 * Double(heightDato)!
            let calorieIntakeTres = 6.8 * Double(ageDato)!
            let calorieIntakeCuatro = calorieIntakeUno + (calorieIntakeDos - calorieIntakeTres)
            let calorieIntakeDato = calorieIntakeCuatro * activityDato
            Model.instance.addCalorieIntake(calorieIntakeDato: calorieIntakeDato)
        }
    }
}
