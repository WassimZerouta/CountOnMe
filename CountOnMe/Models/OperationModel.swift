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
    var result: Int {
           return priorityOrder(operationToReduce: operationToReduce)
       }
    
    // init
    init(operationToReduce: [String]) {
        self.operationToReduce = operationToReduce
    }
    
    // Define the priority order in the operation
    private func priorityOrder(operationToReduce: [String]) -> Int {
        var operationsToReduce = operationToReduce
        var result = 0
        
        // While operation to reduce isn't empty
        while operationsToReduce.count > 1 {
            
            // Verify if operation to reduce contains "x" or "/"
            while operationsToReduce.contains("x") || operationsToReduce.contains("/") {
                // Take the indexs needed in the calcul
                if  let index = operationsToReduce.firstIndex(of: "x")  {
                    let before = Int(operationsToReduce[index-1])
                    let after = Int(operationsToReduce[index+1])
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
                    let before = Int(operationsToReduce[index-1])
                    let after = Int(operationsToReduce[index+1])
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
                    let before = Int(operationsToReduce[index-1])
                    let after = Int(operationsToReduce[index+1])
                    if let first = before, let second = after {
                        // create an instance of Calc to realize the calcule
                        result = Calc(first: first, operand: .add, second: second).calcul
                        // return the new operationToReduce
                        operationsToReduce = refreshOperationsToReduce(operationToReduce: operationsToReduce, beforeIndex: index-1, result: result)
                        
                    }
                }
                // Take the indexs needed in the calcul
                if  let index = operationsToReduce.firstIndex(of: "-") {
                    let before = Int(operationsToReduce[index-1])
                    let after = Int(operationsToReduce[index+1])
                    if let first = before, let second = after {
                        // create an instance of Calc to realize the calcule
                        result = Calc(first: first, operand: .minus, second: second).calcul
                        // return the new operationToReduce
                        operationsToReduce = refreshOperationsToReduce(operationToReduce: operationsToReduce, beforeIndex: index-1, result: result)
                    }
                }
            }
        }
        return result
    }
    
    // return operationToReduce withoud all the indexs used in the calcul and replaced per the result
    private func refreshOperationsToReduce(operationToReduce: [String] ,beforeIndex: Int, result: Int) -> [String] {
        var operationsToReduce = operationToReduce
        operationsToReduce.remove(at: beforeIndex)
        operationsToReduce.remove(at: beforeIndex)
        operationsToReduce.remove(at: beforeIndex)
        operationsToReduce.insert("\(result)", at: beforeIndex)
        
        return operationsToReduce
    }
}
