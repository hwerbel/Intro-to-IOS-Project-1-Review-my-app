//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Fred Werbel on 12/30/15.
//  Copyright © 2015 Hannah Werbel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BillField: UITextField!
    
    @IBOutlet weak var TipLabel: UILabel!
    
    @IBOutlet weak var TotalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        TipLabel.text = "$0.00"
        TotalLabel.text = "$0.00"
        
        self.title = "Tip Calculator"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var defaultTip = NSString(string: "20").doubleValue
        defaults.setDouble(defaultTip, forKey: "default_tip_percentage")
        defaults.synchronize()
        
        var minTip = NSString(string: "18").doubleValue
        defaults.setDouble(minTip, forKey: "min_tip_percentage")
        defaults.synchronize()
        
        var maxTip = NSString(string: "22").doubleValue
        defaults.setDouble(maxTip, forKey: "max_tip_percentage")
        defaults.synchronize()
       
    }
    
    override func viewWillAppear (animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultValue = defaults.doubleForKey("default_tip_percentage")
        let minValue = defaults.doubleForKey("min_tip_percentage")
        let maxValue = defaults.doubleForKey("max_tip_percentage")
        
        self.tipControl.setTitle("\(minValue)%", forSegmentAtIndex: 0)
        self.tipControl.setTitle("\(defaultValue)%", forSegmentAtIndex: 1)
        self.tipControl.setTitle("\(maxValue)%",forSegmentAtIndex: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultValue = defaults.doubleForKey("default_tip_percentage")
        let minValue = defaults.doubleForKey("min_tip_percentage")
        let maxValue = defaults.doubleForKey("max_tip_percentage")

        
        var tipPercentages = [minValue, defaultValue, maxValue]
        var tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        
        var tipPercentage = tipPercent/100
        
        var billAmount = NSString(string: BillField.text!).doubleValue
        
        
        var tip = billAmount * tipPercentage
        
        var total = billAmount + tip
        
       
        TipLabel.text = "$\(tip)"
        TotalLabel.text = "$\(total)"
        
        TipLabel.text = String(format: "$%.2f", tip)
        TotalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

