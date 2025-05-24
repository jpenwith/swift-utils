import Testing
import  SwiftUtils

extension Tests {
    @Suite("String")
    struct String {
        @Test func testNilIfEmptyWithEmptyString() {
            let empty = ""
            let result = empty.nilIfEmpty
            #expect(result == nil)
        }

        @Test func testNilIfEmptyWithNonEmptyString() {
            let nonEmpty = "hello"
            let result = nonEmpty.nilIfEmpty
            #expect(result == "hello")
        }
    }}
