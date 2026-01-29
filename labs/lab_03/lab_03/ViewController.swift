//
//  ViewController.swift
//  lab_03
//
//  Created by Jayden Lewis on 2026-01-27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    private var currentNumber:String = ""
    
    private var firstOperand:Int? = nil
    
    private var currentOperator:String? = nil
    
    func clearAll() {
        
        firstOperand = nil
        currentNumber = ""
        currentOperator = nil
        outputLabel.text = "0"
    }

    @IBAction func clearPressed(){
        
        clearAll()
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        
        guard let digit = sender.titleLabel?.text
        else { return }
        
        if currentNumber == "0" {
            currentNumber = ""
        }
        
        currentNumber += digit
        outputLabel.text = currentNumber
    }
    
    @IBAction func OperatorPressed(_ sender: UIButton) {
        
        guard let operation = sender.titleLabel?.text,
              let value = Int(currentNumber)
        else {
            return
        }
        
        firstOperand = value
        currentOperator = operation
        currentNumber = ""
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        
        guard let operation = currentOperator,
              let first = firstOperand,
              let second = Int(currentNumber)
        else {
            return
        }
        
        var result = 0
        
        switch operation {
        
        case "+":
            result = first + second
        
        case "-":
            result = first - second
        
        case "*":
            result = first * second
        
        case "/":
            
            if second != 0 {
                result = first/second
            }
            
            else {
                outputLabel.text = "Error: Division by 0"
                firstOperand = nil
                currentOperator = nil
                return
            }
        
        default:
            return
        }
        
        outputLabel.text = String(result)
        currentNumber = String(result)
        firstOperand = result
        currentOperator = nil
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        clearAll()
    }
}
