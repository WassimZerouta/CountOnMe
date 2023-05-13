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
    let first: Float
    let operand: Operand
    let second: Float
    
    // Select the operand based on the Operand enum
    var calcul: Float {
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
    
    // Operand enum
    enum Operand {
        case multiply
        case divide
        case add
        case minus
    }
    
    // Init
    init(first: Float, operand: Operand, second: Float) {
        self.first = first
        self.operand = operand
        self.second = second
    }
}


