//
//  OperationModel.swift
//  CountOnMe
//
//  Created by Wass on 10/05/2023.
//  Copyright © 2023 Vincent Saluzzo. All rights reserved.
//

import Foundation

// Struct Operation
struct Operation {
    
    // Define variable to init
    let operationToReduce: [String]
    
    // computed property to obtain the result of the operation
    var result: Float {
           return priorityOrder(operationToReduce: operationToReduce)
       }
    
    // init
    init(operationToReduce: [String]) {
        self.operationToReduce = operationToReduce
    }
    
    // Define the priority order in the operation
    private func priorityOrder(operationToReduce: [String]) -> Float {
        var operationsToReduce = operationToReduce
        var result: Float = 0
        
        // While operation to reduce isn't empty
        while operationsToReduce.count > 1 {
            
            // Verify if operation to reduce contains "x" or "/"
            while operationsToReduce.contains("x") || operationsToReduce.contains("/") {
                // Take the indexs needed in the calcul
                if  let index = operationsToReduce.firstIndex(of: "x")  {
                    let before = Float(operationsToReduce[index-1])
                    let after = Float(operationsToReduce[index+1])
                    if let first = before, let second = after {
                        // create an instance of Calc to realize the calcule
                        result = Calc(first: first, operand: .multiply, second: second).calcul
                        // return the new operationToReduce
                        operationsToReduce = refreshOperationsToReduce(operationToReduce: operationsToReduce, beforeIndex: index-1, result: result)
                        
                    }
                }
                // Take the indexs needed in the calcul
                if  let index = operationsToReduce.firstIndex(of: "/") {
                    // Take the indexs needed in the calcul
                    let before = Float(operationsToReduce[index-1])
                    let after = Float(operationsToReduce[index+1])
                    if let first = before, let second = after {
                        //Check if second is diffent to 0 then create an instance of Calc to realize the calcule
                        if second == 0 {result = 0 } else { result = Calc(first: first, operand: .divide, second: second).calcul }
                        operationsToReduce = refreshOperationsToReduce(operationToReduce: operationsToReduce, beforeIndex: index-1, result: result)
                        
                    }
                }
            }
            // Verify if operation to reduce contains "+" or "-"
            while operationsToReduce.contains("+") || operationsToReduce.contains("-") {
                // Take the indexs needed in the calcul
                if  let index = operationsToReduce.firstIndex(of: "+") {
                    let before = Float(operationsToReduce[index-1])
                    let after = Float(operationsToReduce[index+1])
                    if let first = before, let second = after {
                        // create an instance of Calc to realize the calcule
                        result = Calc(first: first, operand: .add, second: second).calcul
                        // return the new operationToReduce
                        operationsToReduce = refreshOperationsToReduce(operationToReduce: operationsToReduce, beforeIndex: index-1, result: result)
                        
                    }
                }
                // Take the indexs needed in the calcul
                if  let index = operationsToReduce.firstIndex(of: "-") {
                    let before = Float(operationsToReduce[index-1])
                    let after = Float(operationsToReduce[index+1])
                    if let first = before, let second = after {
                        // create an instance of Calc to realize the calcule
                        result = Calc(first: first, operand: .minus, second: second).calcul
                        // return the new operationToReduce
                        operationsToReduce = refreshOperationsToReduce(operationToReduce: operationsToReduce, beforeIndex: index-1, result: result)
                    }
                }
            }
        }
        let roundedResult = String(format: "%.2f", result)
        return Float(roundedResult)!
    }
    
    // return operationToReduce withoud all the indexs used in the calcul and replaced per the result
    private func refreshOperationsToReduce(operationToReduce: [String] ,beforeIndex: Int, result: Float) -> [String] {
        var operationsToReduce = operationToReduce
        operationsToReduce.remove(at: beforeIndex)
        operationsToReduce.remove(at: beforeIndex)
        operationsToReduce.remove(at: beforeIndex)
        operationsToReduce.insert("\(result)", at: beforeIndex)
        
        return operationsToReduce
    }
}
