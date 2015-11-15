//
//  ViewController.swift
//  Calculator
//

import UIKit

class ViewController: UIViewController {

    let calculations: CalculationDelegate = DefaultCalculations()
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func addButtonPressed(sender: UIButton) {
        setOperator("+", withFunction: +)
    }
    
    @IBAction func subtractButtonPressed(sender: UIButton) {
        setOperator("-", withFunction: -)
    }
    
    @IBAction func multiplyButtonPressed(sender: UIButton) {
        setOperator("*", withFunction: *)
    }
    
    @IBAction func divideButtonPressed(sender: UIButton) {
        setOperator("/", withFunction: /)
    }
    
    func setOperator(character: String, withFunction function: (Double, Double) -> (Double)) {
        //DefaultOperator is part of the default CalculationDelegate
        let customOperator = DefaultOperator(forCharacter: character, withFunction: function)
        calculations.setOperator(customOperator)
        
        //again, update the text on screen
        resultLabel.text = calculations.resultNumber.roundedString
    }
    
    @IBAction func equalsButtonPressed(sender: UIButton) {
        calculations.clearInputAndSave(true)
        resultLabel.text = calculations.resultNumber.roundedString
    }
    
    @IBAction func clearButtonPressed(sender: UIButton) {
        calculations.clearInputAndSave(false)
        resultLabel.text = calculations.resultNumber.roundedString
    }
    
    @IBAction func numberButtonPressed(sender: UIButton) {
        let buttonTitle = sender.titleLabel!.text!
        let buttonNumber = Int(buttonTitle)! //converts String to Int
        calculations.handleInput(buttonNumber)
        
        //also update the text on screen
        resultLabel.text = calculations.resultNumber.roundedString
    }
}

