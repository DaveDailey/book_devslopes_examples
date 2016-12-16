//
//  ViewController.swift
//  TipsyTipCalculator
//
//  Created by Pearson Basham on 10/18/16.
//  Copyright © 2016 Devslopes. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    
    
    @IBOutlet weak var enterBillTF: UITextField!
    @IBOutlet weak var tipPercentLbl: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmountLbl: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    
    var tipCalcBrains = TipCalcBrains(billAmount: 25.00, tipPercent: 0.15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipPercentValue()
        
    }
    
    @IBAction func billAmountChange(_ sender: AnyObject) {
        calculateTip()
    }
    
    @IBAction func tipPercentChange(_ sender: AnyObject) {
        tipPercentValue()
        calculateTip()
    }
    
    func calculateTip() {
        tipCalcBrains.tipPercent = Double(tipPercentSlider.value)
        tipCalcBrains.billAmount = ((enterBillTF.text)! as NSString).doubleValue
        tipCalcBrains.calculateTip()
        updateBillUI()
    }
    
    func updateBillUI() {
        totalAmount.text = String(format: "$%0.2f", tipCalcBrains.totalAmount)
        tipAmountLbl.text = String(format: "$%0.2f", tipCalcBrains.tipAmount)
    }
    
    func tipPercentValue() {
        tipPercentLbl.text = "Tip: \(Int(tipPercentSlider.value * 100))%"
    }
    
}








