//
//  ViewController.swift
//  Tipper
//
//  Created by Richard Bryant on 8/16/16.
//  Copyright © 2016 Joopkins. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {

    // MARK: - @IBOutlets
    @IBOutlet weak var TipperTitleView: UIView!
    @IBOutlet weak var TipperTitleLabel: UILabel!
    @IBOutlet weak var BillAmountTextField: UITextField!
    @IBOutlet weak var TipPercentLabel: UILabel!
    @IBOutlet weak var TipPercentSlider: UISlider!
    @IBOutlet weak var TipAmountLabel: UILabel!
    @IBOutlet weak var TotalAmountLabel: UILabel!
    @IBOutlet weak var splitNumber: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitCost: UILabel!
    
    // MARK: - @Properties
    var tipCalculator = TipCalculator(billAmount: 0.0, tipPercent: 0.0)
    
    
    // MARK: - Initialize Views
    override func viewDidLoad() {
        super.viewDidLoad()
        TipperTitleView.layer.shadowOpacity = 1.0
    }

    // MARK: - @IBActions
    @IBAction func splitAmountChanged(_ sender: AnyObject) {
        splitNumber.text = "Split: \(Int(splitSlider.value))"
        updateUI()
    }
    
    @IBAction func billAmountChanged(_ sender: AnyObject) {
        calculateTip()
    }
    
    @IBAction func tipPercentChanged(_ sender: AnyObject) {
        calculateTip()
    }
    
    // MARK: - Functions
    func calculateTip() {
        tipCalculator.tipPercent = Double(TipPercentSlider.value)
        if let billAmount = BillAmountTextField.text {
            tipCalculator.billAmount = (billAmount as NSString).doubleValue
        }
        
        tipCalculator.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        TipPercentLabel.text = "Tip: \(Int(round(TipPercentSlider.value * 100)))%"
        TipAmountLabel.text = String(format: "$%0.2f", tipCalculator.tipAmount)
        TotalAmountLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        splitCost.text = String(format: "$%0.2f", tipCalculator.totalAmount / Double(Int(splitSlider.value)))
    }
}

