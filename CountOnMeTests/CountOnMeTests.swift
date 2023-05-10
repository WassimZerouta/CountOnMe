//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Wass on 10/05/2023.
//  Copyright © 2023 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeTests: XCTestCase {

    // Addition test
    func testGivenResultIsZero_WhenIAddOneToFive_ThenTheResultWillBeSix() {
        //Given
        let operationToReduce = ["1","+","5"]

        //When
        let operation = Operation(operationToReduce: operationToReduce)

        //Then
        XCTAssert(operation.result == 6)
    }

    // Substraction test
    func testGivenResultIsZero_WhenISubstractOneToFive_ThenTheResultWillBeFore() {
        //Given
        let operationToReduce = ["5","-","1"]

        //When
        let operation = Operation(operationToReduce: operationToReduce)

        //Then
        XCTAssert(operation.result == 4)

    }

    // Multiplication test
    func testGivenResultIsZero_WhenIMultiplyTwoPerFive_ThenTheResultWillBeTen() {
        //Given
        let operationToReduce = ["2","x","5"]

        //When
        let operation = Operation(operationToReduce: operationToReduce)

        //Then
        XCTAssert(operation.result == 10)

    }

    // Division test
    func testGivenResultIsZero_WhenIDivideTenPerTwo_ThenTheResultWillBeFive() {
        //Given
        let operationToReduce = ["10","/","2"]

        //When
        let operation = Operation(operationToReduce: operationToReduce)

        //Then
        XCTAssert(operation.result == 5)

    }

    // Multiple calculs test
    func testGivenResultIsZero_WhenIAddOneToFivMultiplyPerTwoDividePerTwo_ThenTheResultWillBeSix() {
        //Given
        let operationToReduce = ["1","+","5","x","2","/","2"]

        //When
        let operation = Operation(operationToReduce: operationToReduce)

        //Then
        XCTAssert(operation.result == 6)

    }

}
