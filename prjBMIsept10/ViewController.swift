//
//  ViewController.swift
//  prjBMIsept10
//
//  Created by english on 2021-09-10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnCalculate: UIButton!
    
    @IBOutlet weak var txtHeight: UITextField!
    
    @IBOutlet weak var txtWeight: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    @IBAction func btnCalculate(_ sender: Any) {
        if(!txtHeight.hasText){
            Toast.ok(view: self, title: "Information", message: "Please enter Height in cm to check your BMI")
            //here i just want to focus on the txtHeight
            return
        }
        if(!txtWeight.hasText){
            Toast.ok(view: self, title: "Information", message: "Please enter Weight in Kg to check your BMI")
            //here i just want to focus on the txtHeight
            return
        }
        
        //we will start here by getting value from text box to our variables and calculate bmi on the bases of that
        
        if let strHeight : String = txtHeight.text{
            if let height : Double = Double(strHeight){
                //this let is important because we need the text inside a string
                //and than that string we can cast into int and use ! sign as well
                if let strWeight : String = txtWeight.text{
                    if let weight : Double = Double(strWeight){
                        if height >= 80 && height <= 250 {
                            //here our height is good and now we gonna check for weight
                            if(weight >= 30 && weight <= 300){
                                //here i will calculate BMI and show in label
                                let heightinMeters = Double(height) / 100.0
                                
                                var bmi : Double = Double(weight) / (heightinMeters * heightinMeters)
                                
                                bmi = round(bmi * 10)/10.0
                                
                                lblResult.isHidden = false
                                
                                
                                if(bmi > 0 && bmi < 18.5){
                                    lblResult.text = "BMI Classification = UnderWeight"
                                    lblResult.backgroundColor = #colorLiteral(red: 0.4810310602, green: 0.6983346343, blue: 0.8787245154, alpha: 1)
                                }else if(bmi < 25){
                                    lblResult.text = "BMI Classification = Normal weight"
                                    lblResult.backgroundColor = #colorLiteral(red: 0.2438544035, green: 0.8291546702, blue: 0.4002701044, alpha: 1)
                                }else if(bmi < 30){
                                    lblResult.text = "BMI Classification = Overweight"
                                    lblResult.backgroundColor = #colorLiteral(red: 0.9325566292, green: 0.8834809661, blue: 0.1991587281, alpha: 1)
                                }else if(bmi <= 100){
                                    lblResult.text = "BMI Classification = Obesity"
                                    lblResult.backgroundColor = #colorLiteral(red: 0.9841260314, green: 0.5057349801, blue: 0.1907022893, alpha: 1)
                                }else{
                                    lblResult.text = "Something Went Wrong, Please try again"
                                }
                                
                            }else{
                                Toast.ok(view: self, title: "Review the weight", message: "Enter a weight between 30 Kg and 300 Kg.")
                            }
                        }else{
                            Toast.ok(view: self, title: "Review the height", message: "Enter a height between 80 cm and 250 cm.")
                        }
                    }else{
                        Toast.ok(view: self, title: "Invalid text", message: "Only numbers are allowed for Weight.")
                    }
                }
            }else{
                Toast.ok(view: self, title: "Invalid text", message: "Only numbers are allowed for height.")
            }
        }
        

    }
    
    //when text change i need to hide the result lbl
    
    @IBAction func txtHeightOnChange(_ sender: Any) {
        lblResult.isHidden = true
    }
    @IBAction func txtWeightOnChange(_ sender: Any) {
        lblResult.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnCalculate.layer.cornerRadius = 10
        btnCalculate.clipsToBounds = true
        
        lblResult.isHidden = true
    }

    

}

