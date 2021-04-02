//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
       let result = String(format: "%.2f", sender.value)
        heightLabel.text = result + "m"
        //print(result)
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let result = String(format: "%.0f", sender.value)
        weightLabel.text = result + "kg"
         //print(result)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let weight = weightSlider.value
        let height = heightSlider.value
        calculatorBrain.calculateBMI(height: height , weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destionationVC = segue.destination as! ResultViewController
            destionationVC.bmiValue = calculatorBrain.getBMIValue()
            destionationVC.advice = calculatorBrain.getAdvice()
            destionationVC.color = calculatorBrain.getColor()
        }
    }
}

