//
//  ViewController.swift
//  Prework_2
//
//  Created by Darielys Prado on 2/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var secondaryView: UIView!
    
    @IBOutlet weak var billAndTipLabel: UILabel!
    @IBOutlet weak var totalEachLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    
    @IBOutlet weak var slider: magicSlider!
    
    @IBOutlet weak var billLabel: UILabel!
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var totalBill: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var partySizeStepper: UIStepper!
    
    @IBOutlet weak var enableRetro: UISwitch!
    
    var partySize: Int = 1

    @IBOutlet weak var partySizeLabel: UILabel!
    
    var thumb = UIImage(named: "up")
    var smile = UIImage(named: "smile")
    var star = UIImage(named: "star")
    let smileretro = UIImage(named: "retro")
    let teeth = UIImage(named: "smileretro")
    let wowretro = UIImage(named: "struckretro")
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //update label with stepper
        partySizeStepper.wraps = true
        partySizeStepper.autorepeat = true
        partySizeStepper.maximumValue = 100
        
        switchRetro(isRetro: false)

    }
    
    func switchRetro (isRetro: Bool){
        
        let goRetro = isRetro ? RetroMode.retro : RetroMode.normal

        headerView.backgroundColor = goRetro.primaryColor
        mainView.backgroundColor = goRetro.secondaryColor
        secondaryView.backgroundColor = goRetro.outputColor
        
        titleLabel.textColor = goRetro.primaryTextColor
        totalBill.textColor = goRetro.outputTextColor
        totalLabel.textColor = goRetro.primaryTextColor
        billLabel.textColor = goRetro.outputTextColor
        
        billAndTipLabel.textColor = goRetro.outputTextColor
        totalEachLabel.textColor = goRetro.primaryTextColor
        tipLabel.textColor = goRetro.primaryTextColor
        titleLabel.textColor = goRetro.primaryTextColor
        partyLabel.textColor = goRetro.secondTextColor
        tipPercentage.textColor = goRetro.secondTextColor
      
    }
    
    @IBAction func enableTheme(_ sender: UISwitch) {
        switchRetro(isRetro: sender.isOn)
        
        if enableRetro.isOn {
            titleLabel.font = UIFont(name:"Menlo", size:24.0)
            billAndTipLabel.font = UIFont(name:"Menlo", size:17.5)
            totalEachLabel.font = UIFont(name:"Menlo", size:16.5)
            tipLabel.font = UIFont(name:"Menlo", size:17.5)
            partyLabel.font = UIFont(name:"Menlo", size:17.5)
            tipPercentage.font = UIFont(name:"Menlo", size:15.0)
            billLabel.font = UIFont(name:"Menlo", size:17.5)
            totalLabel.font = UIFont(name:"Menlo", size:18)
            totalBill.font = UIFont(name:"Menlo", size:18)
            
        }
        else {
             titleLabel.font = UIFont(name:"HelveticaNeue-Bold", size:24.0)
             billAndTipLabel.font = UIFont(name:"HelveticaNeue-Medium", size:23.0)
             totalEachLabel.font = UIFont(name:"HelveticaNeue-Medium", size:22.5)
             tipLabel.font = UIFont(name:"HelveticaNeue-Medium", size:22.0)
             partyLabel.font = UIFont(name:"HelveticaNeue-Medium", size:23.0)
             tipPercentage.font = UIFont(name:"HelveticaNeue-Medium", size:17.0)
             billLabel.font = UIFont(name:"HelveticaNeue-Medium", size:23.0)
             totalLabel.font = UIFont(name:"HelveticaNeue-Medium", size:23.0)
             totalBill.font = UIFont(name:"HelveticaNeue-Medium", size:23.0)
        }
        updateEmojis()
        
    }
    
    //make keyboard dissapear tapping anywhere
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //make keyboard appear at launch on text field
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billTextField.becomeFirstResponder()
    }
    @IBAction func partySizeAdd(_ sender: UIStepper) {
        partySize = Int(sender.value)
        partySizeLabel.text = Int(sender.value).description
    }

    @IBAction func sliderAction(_ sender: Any) {
        updateEmojis()
        calculateTip()
               
    }
    
    @IBAction func partySizeUpdate(_ sender: Any) {
        calculateTip()
    }
    
    @IBAction func billLabelAction(_ sender: Any) {
        calculateTip()
    }
    
    func calculateTip(){
        let bill = Double(billTextField.text!) ?? 0
        
        let tip = bill * (Double(Int(slider.value)) / 100)
        let total = Double(tip) + bill
        let totalEach = total / Double(partySize)
        totalLabel.text = "$" + String (format: "%.2f", totalEach)
        totalBill.text = "$" + String (format: "%.2f", total)
        
    }
    
    func updateEmojis(){
        if slider.value >= 15 && slider.value < 18 {
           
            slider.thumbImage = thumb
            if enableRetro.isOn {
                slider.thumbImage = smileretro
            }
        }
        else if slider.value >= 18 && slider.value < 20 {
            slider.thumbImage = smile
            if enableRetro.isOn {
                slider.thumbImage = teeth
            }
        }
        else {
            slider.thumbImage = star
            if enableRetro.isOn {
                slider.thumbImage = wowretro
            }
        }
        tipPercentage.text = String(Int(slider.value)) + "%"
    }
    
}
            
    
    
    


