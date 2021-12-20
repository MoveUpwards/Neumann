//
//  TimeIntervalTests.swift
//  
//
//  Created by Loïc GRIFFIE on 20/12/2021.
//

import XCTest
@testable import Neumann

class TimeIntervalTests: XCTestCase {
    func testTimeintervalDurationHoursMinutesSeconds() throws {
        let duration: TimeInterval = 3600 + 40 * 60 + 23 // 1h40m23s
        XCTAssertEqual(duration.hours, 1)
        XCTAssertEqual(duration.minutes, 40)
        XCTAssertEqual(duration.duration, "1h40m")
    }

    func testTimeintervalDurationHoursMinutes() throws {
        let duration: TimeInterval = 3600 + 40 * 60 // 1h40m
        XCTAssertEqual(duration.hours, 1)
        XCTAssertEqual(duration.minutes, 40)
        XCTAssertEqual(duration.duration, "1h40m")
    }

    func testTimeintervalDurationMinutesSeconds() throws {
        let duration: TimeInterval = 40 * 60 + 23 // 40m23s
        XCTAssertEqual(duration.hours, 0)
        XCTAssertEqual(duration.minutes, 40)
        XCTAssertEqual(duration.seconds, 23)
        XCTAssertEqual(duration.duration, "40m23s")
    }
}
