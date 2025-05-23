import SwiftUtils
import Testing

@Test func testExample() throws {
    // XCTest Documentation
    // https://developer.apple.com/documentation/xctest

    // Defining Test Cases and Test Methods
    // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
}

@Test func testMinutes() {
    #expect(Duration.minutes(77) == .seconds(4620))
}

@Test func testHours() {
    #expect(Duration.hours(2) == .minutes(120))
}

@Test func testDays() {
    #expect(Duration.days(3) == .hours(72))
}
