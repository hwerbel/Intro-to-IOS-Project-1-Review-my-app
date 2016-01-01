//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Fred Werbel on 12/31/15.
//  Copyright © 2015 Hannah Werbel. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultField: UITextField!
    
    @IBOutlet weak var minField: UITextField!
    
    @IBOutlet weak var maxField: UITextField!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var defaultTip = defaults.doubleForKey("default_tip_percentage")
        
       
        defaultField.text = "\(defaultTip)"
        
        
        var minTip = defaults.doubleForKey("min_tip_percentage")
        
        minField.text = "\(minTip)"
        
        
        var maxTip = defaults.doubleForKey("max_tip_percentage")
       
            maxField.text = "\(maxTip)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func defaultEditingChanged(sender: AnyObject) {
        
        var defaultTip = NSString(string: defaultField.text!).doubleValue
        
        
        defaults.setDouble(defaultTip, forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    
    
    @IBAction func minEditingChanged(sender: AnyObject) {
        
        var minDefaultTip = NSString(string: minField.text!).doubleValue
        
        defaults.setDouble(minDefaultTip, forKey: "min_tip_percentage")
        defaults.synchronize()

    }
  
    
    @IBAction func maxEditingChanged(sender: AnyObject) {
        
        var maxDefaultTip = NSString(string: maxField.text!).doubleValue
        
        defaults.setDouble(maxDefaultTip, forKey: "max_tip_percentage")
        defaults.synchronize()

    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
