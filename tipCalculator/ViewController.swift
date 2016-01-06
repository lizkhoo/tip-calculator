//
//  ViewController.swift
//  tipCalculator
//
//  Created by Liz Khoo on 1/5/16.
//  Copyright (c) 2016 Liz Khoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //default values for Tip and Total
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"

        self.tipField.alpha = 0
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    //main body of calculation functionality
    
    @IBAction func onEditingChange(sender: AnyObject) {
        
        var tipPercentages = [0.15, 0.18, 0]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        if tipControl.selectedSegmentIndex == 2 {
            tipPercentage = 0.25
            UIView.animateWithDuration(0.4, animations: {
                // fade in tipField
                self.tipField.alpha = 1
            })
            
            //convert tipField amount into decimal
            
            let tipOther = (NSString(string: tipField.text!).doubleValue)/100
            print(tipOther)
            
            tipPercentage = tipOther
        }
        
        // take bill field input and convert to decimal
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        //use backslash and paren to input variable's value
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        //format tip to $0.00
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    //dismiss keyboard by tapping anywhere in Main
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

