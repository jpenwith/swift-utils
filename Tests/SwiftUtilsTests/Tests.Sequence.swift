import Testing
import SwiftUtils

extension Tests {
    @Suite("Sequence")
    struct Sequence {
        @Test func testAsyncMap() async throws {
            let input = [1, 2, 3]
            let result = await input.asyncMap { i in i * 2 }
            #expect(result == [2, 4, 6])
        }

        @Test func testAsyncForEach() async throws {
            let input = [1, 2, 3]
            var collected = [Int]()
            await input.asyncForEach { element in collected.append(element * 2) }
            #expect(collected == [2, 4, 6])
        }

        @Test func testAsyncReduce() async throws {
            let input = [1, 2, 3, 4]
            let result = await input.asyncReduce(0) { acc, element in acc + element }
            #expect(result == 10)
        }

        @Test func testSortedOnClosure() {
            let input = ["cherry", "apple", "banana"]
            let result = input.sorted(on: { $0.count })
            #expect(result == ["apple", "cherry", "banana"])
        }

        @Test func testSortedOnKeyPath() {
            struct Item { let name: Swift.String; let quantity: Int }
            let input = [
                Item(name: "apple", quantity: 5),
                Item(name: "banana", quantity: 2),
                Item(name: "cherry", quantity: 7)
            ]
            let result = input.sorted(on: \.quantity)
            #expect(result.map { $0.name } == ["banana", "apple", "cherry"])
        }
    }
}
