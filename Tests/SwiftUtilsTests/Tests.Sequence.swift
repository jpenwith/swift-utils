import Testing
import  SwiftUtils

extension Tests {
    @Suite("Sequence")
    struct Sequence {
        @Test func testAsyncMap() async throws {
            let input = [1, 2, 3]
            let result = await input.asyncMap { i in i * 2 }
            #expect(result == [2, 4, 6])
        }

        @Test func testAsyncReduce() async throws {
            let input = [1, 2, 3, 4]
            let result = await input.asyncReduce(0) { acc, element in acc + element }
            #expect(result == 10)
        }

        @Test func testAsyncForEach() async throws {
            let input = [1, 2, 3]
            var collected = [Int]()
            await input.asyncForEach { element in collected.append(element * 2) }
            #expect(collected == [2, 4, 6])
        }
    }
}
