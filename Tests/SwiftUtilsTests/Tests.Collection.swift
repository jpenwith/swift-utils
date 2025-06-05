import Testing
import SwiftUtils

extension Tests {
    @Suite("Collection")
    struct Collection {
        @Test func testConcurrentMap() async throws {
            let input = [1, 2, 3]
            let result = await input.concurrentMap { i in i * 2 }
            #expect(result == [2, 4, 6])
        }

        @Test func testConcurrentForEach() async throws {
            let input = [1, 2, 3]
            actor Box {
                var values = [Int]()
                func add(_ value: Int) {
                    values.append(value)
                }
            }
            let box = Box()
            await input.concurrentForEach { element in await box.add(element * 2) }
            let result = await box.values.sorted()
            #expect(result == [2, 4, 6])
        }

        @Test func testConcurrentCompactMap() async throws {
            let input = [1, 2, 3, 4]
            let result = await input.concurrentCompactMap { value in
                value.isMultiple(of: 2) ? value : nil
            }
            #expect(result == [2, 4])
        }
    }
}
