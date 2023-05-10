//
//  CalcModel.swift
//  CountOnMe
//
//  Created by Wass on 06/05/2023.
//  Copyright © 2023 Vincent Saluzzo. All rights reserved.
//

import Foundation

// Struct Calc
struct Calc {
    
    // Define variable to init
    let first: Int
    let operand: Operand
    let second: Int
    
    // Select the operand based on the Operand enum
    var calcul: Int {
        switch operand {
        case .multiply:
            return first * second
        case .divide:
            return first / second
        case .add:
            return first + second
        case .minus:
            return first - second
        }
    }
    
    // Operand enul
    enum Operand {
        case multiply
        case divide
        case add
        case minus
    }
    
    // Init
    init(first: Int, operand: Operand, second: Int) {
        self.first = first
        self.operand = operand
        self.second = second
    }
}


