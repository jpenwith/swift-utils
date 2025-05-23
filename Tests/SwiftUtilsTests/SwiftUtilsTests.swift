import SwiftUtils
import Testing


@Suite("Duration")
struct Duration {
    @Test func testMinutes() {
        #expect(Duration.minutes(77) == .seconds(4620))
    }

    @Test func testHours() {
        #expect(Duration.hours(2) == .minutes(120))
    }

    @Test func testDays() {
        #expect(Duration.days(3) == .hours(72))
    }
}
