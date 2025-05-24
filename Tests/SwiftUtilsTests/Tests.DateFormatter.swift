import Foundation
import SwiftUtils
import Testing


extension Tests {
    @Suite("DateFormatter")
    struct DateFormatter {
        @Test func testInitWithDateFormat() {
            let df = Foundation.DateFormatter(dateFormat: "yyyy-MM-dd")
            #expect(df.dateFormat == "yyyy-MM-dd")
        }

        @Test func testInitWithStyles() {
            let df = Foundation.DateFormatter(dateStyle: .short, timeStyle: .medium)
            #expect(df.dateStyle == .short)
            #expect(df.timeStyle == .medium)
        }

        @Test func testInitWithLocaleTimezoneCalendar() {
            let cal = Calendar(identifier: .iso8601)
            let tz = TimeZone(secondsFromGMT: 3600)
            let loc = Locale(identifier: "fr_FR")
            let df = Foundation.DateFormatter(dateFormat: "yy", locale: loc, timeZone: tz, calendar: cal)
            #expect(df.locale.identifier == "fr_FR")
            #expect(df.timeZone.secondsFromGMT() == 3600)
            #expect(df.calendar.identifier == .iso8601)
        }

        @Test func testInitISO8601Default() {
            let df = Foundation.DateFormatter(iso8601Format: .default)
            #expect(df.dateFormat == "yyyy-MM-dd'T'HH:mm:ssZ")
        }

        @Test func testInitISO8601Microseconds() {
            let df = Foundation.DateFormatter(iso8601Format: .microseconds)
            #expect(df.dateFormat == "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ")
        }
    }
}
