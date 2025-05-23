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

@Suite("Optional")
struct OptionalSuite {
    @Test func testAsyncFlatMapWithValue() async throws {
        let initial: Int? = 3
        let result = await initial.asyncFlatMap { value in String(value) }
        #expect(result == "3")
    }

    @Test func testAsyncFlatMapWithNil() async throws {
        let initial: Int? = nil
        let result = await initial.asyncFlatMap { _ in "ignored" }
        #expect(result == nil)
    }
}
