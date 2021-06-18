//
//  PythagoreTests.swift
//  NeumannTests
//
//  Created by Mac on 07/06/2021.
//  Copyright © 2021 Loïc GRIFFIE. All rights reserved.
//

import XCTest
@testable import Neumann

class PythagoreTests: XCTestCase {
    func testhypotenuse() throws {
        let b = 5.0
        let c = 13.0
        let a = Pythagore.side(otherSide: b, hypotenuse: c)

        XCTAssertEqual(a, 12.0) // c² = a² + b²

        let aa = 7.0
        let bb = 9.0
        let cc = Pythagore.hypotenuse(adjacent: aa, opposite: bb)

        XCTAssertEqual(cc, sqrt(130))
    }

    func testSide() throws {
        let a = 3.0
        let b = 4.0
        let c = 5.0

        XCTAssertEqual(a, Pythagore.side(otherSide: b, hypotenuse: c))
        XCTAssertEqual(b, Pythagore.side(otherSide: a, hypotenuse: c))
        XCTAssertEqual(c, Pythagore.hypotenuse(adjacent: a, opposite: b))

        let alpha = Pythagore.alpha(adjacent: a, opposite: b)

        XCTAssertEqual(a, Pythagore.adjacent(opposite: b, alpha: alpha), accuracy: 1e-15)
        XCTAssertEqual(b, Pythagore.opposite(adjacent: a, alpha: alpha), accuracy: 1e-15)
        XCTAssertEqual(a, Pythagore.adjacent(hypotenuse: c, alpha: alpha), accuracy: 1e-15)
        XCTAssertEqual(b, Pythagore.opposite(hypotenuse: c, alpha: alpha), accuracy: 1e-15)
    }

    func testAltitude() throws {
        let a = 3.0
        let b = 10.0
        let c = Pythagore.hypotenuse(adjacent: a, opposite: b)
        let h = Pythagore.altitude(adjacent: a, opposite: b, hypotenuse: c)

        XCTAssertEqual(h, (a*b) / sqrt(a*a+b*b))
    }

    func testAlpha() throws {
        let a = 3.0
        let b = 10.0
        let alpha = Pythagore.alpha(adjacent: a, opposite: b)

        let c = sqrt(a*a+b*b)
        XCTAssertEqual(alpha.toDegrees, 90.0 - asin(a/c).toDegrees) // sin( beta ) = a / c

        let beta = Pythagore.beta(adjacent: a, opposite: b)

        XCTAssertEqual(alpha.toDegrees + beta.toDegrees, 90.0)
    }

    func testAlphaAndBeta() throws {
        let a = 3.0
        let b = 4.0
        let c = 5.0

        let alpha1 = Pythagore.alpha(adjacent: a, opposite: b)
        let alpha2 = Pythagore.alpha(adjacent: a, hypotenuse: c)
        let alpha3 = Pythagore.alpha(opposite: b, hypotenuse: c)

        let beta1 = Pythagore.beta(adjacent: a, opposite: b)
        let beta2 = Pythagore.beta(adjacent: a, hypotenuse: c)
        let beta3 = Pythagore.beta(opposite: b, hypotenuse: c)

        XCTAssertEqual(alpha1, alpha2, accuracy: 1e-15)
        XCTAssertEqual(alpha1, alpha3, accuracy: 1e-15)
        XCTAssertEqual(beta1, beta2, accuracy: 1e-15)
        XCTAssertEqual(beta1, beta3, accuracy: 1e-15)
        XCTAssertEqual(alpha1.toDegrees + beta1.toDegrees, 90.0)
    }

    func testIsRectangle() throws {
        let a = 3.0
        let b = 4.0
        let c = 5.0

        XCTAssertEqual(Pythagore.isRight(adjacent: a, opposite: b, hypotenuse: c), true)

        let aa = 6.0
        let bb = 9.0
        let cc = 12.0

        XCTAssertEqual(Pythagore.isRight(adjacent: aa, opposite: bb, hypotenuse: cc), false)
    }

    func testRoundingError() throws {
        // With 45° angle adjacent == opposite as alpha == beta
        XCTAssertEqual(Pythagore.adjacent(opposite: 10.0, alpha: 45.0.toRadians),
                       Pythagore.opposite(adjacent: 10.0, alpha: 45.0.toRadians), accuracy: 4e-15)
        // With other angles alpha != beta
        XCTAssertNotEqual(Pythagore.adjacent(opposite: 10.0, alpha: 33.0.toRadians),
                          Pythagore.opposite(adjacent: 10.0, alpha: 33.0.toRadians))
        // Or we can try alpha == (90° - beta)
        XCTAssertNotEqual(Pythagore.adjacent(opposite: 10.0, alpha: 33.0.toRadians),
                          Pythagore.opposite(adjacent: 10.0, alpha: (90.0 - 33.0).toRadians))
    }

    func testFloatingPoint() throws {
        XCTAssertEqual(Float(Pythagore.adjacent(opposite: 10.0, alpha: 45.0.toRadians)),
                       Pythagore.adjacent(opposite: Float(10), alpha: Float(45).toRadians))
        XCTAssertEqual(Float80(Pythagore.adjacent(opposite: 10.0, alpha: 45.0.toRadians)),
                       Pythagore.adjacent(opposite: Float80(10), alpha: Float80(45).toRadians), accuracy: 1e-15)
        XCTAssertEqual(CGFloat(Pythagore.adjacent(opposite: 10.0, alpha: 45.0.toRadians)),
                       Pythagore.adjacent(opposite: CGFloat(10), alpha: CGFloat(45).toRadians), accuracy: 1e-15)
    }

    func testInvalidAngle() throws {
        // Test undefined value from tan
        XCTAssertGreaterThan(tan(90.0.toRadians), 1e+15) // Should be NaN
        XCTAssertGreaterThan(tan(270.0.toRadians), 1e+15) // Should be NaN
        XCTAssertEqual(Pythagore.adjacent(opposite: 10.0, alpha: 90.0.toRadians), .zero, accuracy: 1e-15)
        XCTAssertEqual(Pythagore.adjacent(opposite: 10.0, alpha: 270.0.toRadians), .zero, accuracy: 1.8e-15)

        // Test 0 result from tan
        XCTAssertEqual(tan(0.0.toRadians), 0.0)
        XCTAssertEqual(tan(180.0.toRadians), 0.0, accuracy: 1e-15)
        XCTAssertEqual(Pythagore.adjacent(opposite: 10.0, alpha: 0.0.toRadians), .infinity)
        XCTAssertEqual(Pythagore.adjacent(opposite: 10.0, alpha: 180.0.toRadians), -.infinity)
    }
}
