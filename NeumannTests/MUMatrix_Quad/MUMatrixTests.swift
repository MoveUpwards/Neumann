//
//  MUMatrixTests.swift
//  SejimaTests
//
//  Created by Damien Noël Dubuisson on 18/09/2019.
//  Copyright © 2019 Loïc GRIFFIE. All rights reserved.
//

import XCTest
@testable import Neumann

class MUMatrixTests: XCTestCase {

    func testInits() {
        let matrixEmpty = MUMatrix<Float>()
        let matrix1x4 = MUMatrix<Float>(arrayLiteral: [1.0, 2.0, 3.0, 4.0])
        let matrix1x3 = MUMatrix<Float>(rows: 1, columns: 3)

        XCTAssertEqual(matrixEmpty.rowsCount, 0)
        XCTAssertEqual(matrixEmpty.columnsCount, 0)
        XCTAssertEqual(matrix1x4.rowsCount, 1)
        XCTAssertEqual(matrix1x4.columnsCount, 4)
        XCTAssertEqual(matrix1x3.rowsCount, 1)
        XCTAssertEqual(matrix1x3.columnsCount, 3)

        XCTAssertEqual(matrix1x4.row(0), [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(matrix1x4.column(0), [1.0])
    }

    func testFunctions() {
        var matrix2x2 = MUMatrix<Float>(rows: 2, columns: 2)
        // 0.0  0.0
        // 0.0  0.0
        matrix2x2.fillRow(0, value: 1.0)
        // 1.0  1.0
        // 0.0  0.0

        XCTAssertEqual(matrix2x2.column(0), [1.0, 0.0])
        XCTAssertEqual(matrix2x2.transpose.column(0), [1.0, 1.0])

        matrix2x2.insertRow(1, value: 2.0)
        // 1.0  1.0
        // 2.0  2.0
        // 0.0  0.0
        XCTAssertEqual(matrix2x2[1, 1], 2.0)

        let description = "[\n1.0 1.0 \n2.0 2.0 \n0.0 0.0 \n]"

        XCTAssertEqual(matrix2x2.description, description)

        matrix2x2.insertColumn(1, value: 1.0)
        // 1.0  1.0  1.0
        // 2.0  1.0  2.0
        // 0.0  1.0  0.0

        matrix2x2.swapValue(first: (1, 0), second: (1, 1))
        // 1.0  1.0  1.0
        // 1.0  2.0  2.0
        // 0.0  1.0  0.0

        var matrix4x3 = matrix2x2.resize(row: 4, column: 3)
        // 1.0  1.0  1.0
        // 1.0  2.0  2.0
        // 0.0  1.0  0.0
        // 0.0  0.0  0.0

        matrix4x3.fillColumn(0, value: 3.0)
        // 3.0  1.0  1.0
        // 3.0  2.0  2.0
        // 3.0  1.0  0.0
        // 3.0  0.0  0.0

        matrix4x3.rotate(firstRow: 0, secondRow: 1, cosine: cos(90.0), sine: sin(45.0))
        // 1.2084897    1.2537334   1.2537334
        // -3.8969314   -1.7470508  -1.7470508
        // 3.0          1.0         0.0
        // 3.0          1.0         0.0

        var matrix2x3 = matrix4x3.resize(row: 2, column: 3)
        // 1.2084897    1.2537334   1.2537334
        // -3.8969314   -1.7470508  -1.7470508

        let matrix1x2 = matrix2x3.jacobiSVD()
        XCTAssertEqual(matrix1x2.column(0), [5.0284944, 0.7802778])
        XCTAssertEqual(matrix2x3.column(0), [-4.0538096, 0.46168032])
    }

    func testDeterminant() {
        let a = MUMatrix<Double>(rows: 0, columns: 0)
        XCTAssertEqual(a.determinant, 0.0) // Should throw an error

        let b = MUMatrix(rows: 1, columns: 1, repeatedValue: 42.0)
        XCTAssertEqual(b.determinant, 42.0)

        let c = MUMatrix(arrayLiteral:
                        [3.0, 2.0, 0.0],
                        [0.0, 0.0, 1.0],
                        [2.0, -2.0, 1.0]
        )
        XCTAssertEqual(c.determinant, 10.0)

        let d = MUMatrix(arrayLiteral: [-2, 2, -3], [-1, 1, 3], [2, 0, -1])
        XCTAssertEqual(d.determinant, 18.0)

        let e = MUMatrix(arrayLiteral: [3, 4], [8, 6])
        XCTAssertEqual(e.determinant, -14)

        let f = MUMatrix(arrayLiteral: [4, 3], [6, 8])
        XCTAssertEqual(f.determinant, 14)

        let g = MUMatrix(arrayLiteral: [6, 4, 2], [1, -2, 8], [1, 5, 7])
        XCTAssertEqual(g.determinant, -306)

        let h = MUMatrix(arrayLiteral: [3, 6, 1, 3], [2, 3, 4, 8], [1, 3, 5, -7], [-10, 5, -1, 2])
        XCTAssertEqual(h.determinant, -4402)
    }

    func testCofactor() {
        let a = MUMatrix(arrayLiteral: [3, 2, 0], [0, 0, 1], [2, -2, 1])
        let aCofactor = MUMatrix(arrayLiteral: [2, 2, 0], [-2, 3, 10], [2, -3, 0])
        XCTAssertEqual(a.cofactor, aCofactor)

        let b = MUMatrix(arrayLiteral: [1, 0, 1], [2, 4, 0], [3, 5, 6])
        let bCofactor = MUMatrix(arrayLiteral: [24, -12, -2], [5, 3, -5], [-4, 2, 4])
        XCTAssertEqual(b.cofactor, bCofactor)

        let c = MUMatrix(arrayLiteral: [1, 0, 1], [2, 4, 0], [3, 5, 6])
        let cCofactor = MUMatrix(arrayLiteral: [24, -12, -2], [5, 3, -5], [-4, 2, 4])
        XCTAssertEqual(c.cofactor, cCofactor)
    }

    func testInverse() {
        let a = MUMatrix(arrayLiteral:
                        [3.0, 2.0, 0.0],
                        [0.0, 0.0, 1.0],
                        [2.0, -2.0, 1.0]
        )
        let aInverse = MUMatrix(arrayLiteral:
                            [0.2, -0.2, 0.2],
                            [0.2, 0.3, -0.3],
                            [0.0, 1.0, 0.0]
        )
        XCTAssertEqual(a.inverse, aInverse, accuracy: 0.000000000000001)
        XCTAssertEqual(a • a.inverse, MUMatrix.identity(for: 3))
        XCTAssertEqual(1.2, 1.15, accuracy: 0.1)
        XCTAssertEqual(0.0, 0.0, accuracy: 0.001)

        let b = MUMatrix(arrayLiteral: [4, 3], [3, 2])
        let bInverse = MUMatrix(arrayLiteral: [-2, 3], [3, -4])
        XCTAssertEqual(b.inverse, bInverse)
        XCTAssertEqual(b • b.inverse, MUMatrix.identity(for: 2))
    }

    func testIndentity() {
        let a = MUMatrix<Double>.identity(for: 2)
        let aIdentity = MUMatrix(arrayLiteral: [1, 0], [0, 1])
        XCTAssertEqual(a, aIdentity)

        let b = MUMatrix<Double>.identity(for: 5)
        let bIdentity = MUMatrix(arrayLiteral: [1, 0, 0, 0, 0], [0, 1, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 1, 0], [0, 0, 0, 0, 1])
        XCTAssertEqual(b, bIdentity)
    }
}

public func XCTAssertEqual<T: MUFloatingPoint & CustomStringConvertible>(_ expression1: MUMatrix<T>, _ expression2: MUMatrix<T>, accuracy: T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) {
    XCTAssertEqual(expression1.rowsCount, expression2.rowsCount)
    XCTAssertEqual(expression1.columnsCount, expression2.columnsCount)
    expression1.enumerated().forEach { row, col, value in
        XCTAssertEqual(expression1[row, col], expression2[row, col], accuracy: accuracy, message(), file: file, line: line)
    }
}
