//
//  MUMathTests.swift
//  NeumannTests
//
//  Created by Mac on 17/06/2021.
//  Copyright © 2021 Loïc GRIFFIE. All rights reserved.
//

import XCTest
@testable import Neumann

class MUMathTests: XCTestCase {
    func testCastDoubleToFloatingPoint() throws {
        let a: Float = cast(Double.nan)
        XCTAssertTrue(a.isNaN)
        let b: CGFloat = cast(Double.nan)
        XCTAssertTrue(b.isNaN)

        let c: Float = cast(Double.infinity)
        XCTAssertTrue(c.isInfinite)
        XCTAssertEqual(c, .infinity)
        let d: Double = cast(Double.infinity)
        XCTAssertTrue(d.isInfinite)
        XCTAssertEqual(d, .infinity)

        let e: Float = cast(Double(Int.max)+1.0)
        XCTAssertTrue(e.isInfinite)
        XCTAssertEqual(e, .infinity)
        let f: Float80 = cast(Double(Int.max)+1.0)
        XCTAssertTrue(f.isInfinite)
        XCTAssertEqual(f, .infinity)

        let g: Float = cast(Double(Int.min)-1.0)
        XCTAssertTrue(g.isInfinite)
        XCTAssertEqual(g, -.infinity)
        let h: Double = cast(Double(Int.min)-1.0)
        XCTAssertTrue(h.isInfinite)
        XCTAssertEqual(h, -.infinity)
    }

    private func cast<T: FloatingPoint>(_ value: Double) -> T {
        return T(value)
    }

    func testCastFloatingPointToDouble() throws {
        let a: Double = cast(Float(10.5))
        XCTAssertEqual(a, 10.5)
        let b: Double = cast(CGFloat(1.5))
        XCTAssertEqual(b, 1.5)
        let c: Double = cast(Double(0.33333333333333))
        XCTAssertEqual(c, 0.33333333333333)
        let d: Double = cast(Float80.pi)
        XCTAssertEqual(d, .pi)
    }

    private func cast<T: FloatingPoint>(_ value: T) -> Double {
        return Double(value)
    }

    @available(iOS 14.0, *)
    func testCastFail() throws {
        let a: Double = cast(Float16.pi)
        XCTAssertEqual(a, .zero) // Remove this test if the Double cast use it
    }
}
