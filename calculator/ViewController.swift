//
//  ViewController.swift
//  calculator
//
//  Created by 성 미니 on 22/05/2019.
//  Copyright © 2019 성 미니. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private static let INPUT_VALUE_EMPTY = -1
    
    @IBOutlet weak var resultLabel: UILabel!
    
    private var inputStack = Array<Int>()
    private var currentInputValue: Int = INPUT_VALUE_EMPTY
    
    @IBAction func onNumPadClick(_ sender: UIButton) {
        let numPadValue = Int(sender.currentTitle!)!
        if isInputEmpty() { currentInputValue = 0 }
        currentInputValue = currentInputValue * 10 + numPadValue
        
        updateResultText()
    }
    
    @IBAction func onPlusClick(_ sender: Any) {
        if isInputEmpty() { return }
        
        inputStack.append(currentInputValue)
        currentInputValue = ViewController.INPUT_VALUE_EMPTY
        
        updateResultText()
    }
    
    private func updateResultText() {
        var resultText = ""
        resultText += inputStack.map(String.init).joined(separator: " + ")
        if !isInputEmpty() {
            if !inputStack.isEmpty { resultText += " + " }
            resultText += String(currentInputValue)
        }
        
        if inputStack.count > 1 || (inputStack.count == 1 && !isInputEmpty()) {
            resultText += " = " + String(calculateResult())
        }
        resultLabel.text = resultText
    }
    
    private func calculateResult() -> Int {
        var resultValue = inputStack.reduce(0, +)
        if !isInputEmpty() { resultValue += currentInputValue }
        return resultValue
    }
    
    private func isInputEmpty() -> Bool {
        return currentInputValue == ViewController.INPUT_VALUE_EMPTY
    }
}

