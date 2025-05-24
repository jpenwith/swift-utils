import Testing
import SwiftUtils

extension Tests {
    @Suite("Optional")
    struct Optional {
        @Test func testAsyncFlatMapWithValue() async throws {
            let initial: Int? = 3
            let result = await initial.asyncFlatMap { value in Swift.String(value) }
            #expect(result == "3")
        }

        @Test func testAsyncFlatMapWithNil() async throws {
            let initial: Int? = nil
            let result = await initial.asyncFlatMap { _ in "ignored" }
            #expect(result == nil)
        }
    }
}
