//
//  TipCalculator.swift
//  Tipper
//
//  Created by Richard Bryant on 8/16/16.
//  Copyright © 2016 Joopkins. All rights reserved.
//

import Foundation

class TipCalculator {
    
    private var _billAmount = 0.0
    private var _tipPercent = 0.0
    private var _tipAmount = 0.0
    private var _totalAmount = 0.0
    
    var billAmount: Double {
        get {
            return _billAmount
        } set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipPercent
        } set {
            _tipPercent = newValue
        }
    }
    
    var tipAmount: Double {
        return _tipAmount
    }

    var totalAmount: Double {
        return _totalAmount
    }
    
    init(billAmount: Double, tipPercent: Double) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
    }
    
    func calculateTip () {
        self._tipAmount = billAmount * tipPercent
        self._totalAmount = tipAmount + billAmount
    }
    
    
    
    
}
