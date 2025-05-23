import SwiftUtils
import Testing


@Suite("Duration")
struct Duration {
    @Test func testMinutes() {
        #expect(Swift.Duration.minutes(77) == .seconds(4620))
    }

    @Test func testHours() {
        #expect(Swift.Duration.hours(2) == .minutes(120))
    }

    @Test func testDays() {
        #expect(Swift.Duration.days(3) == .hours(72))
    }
}
