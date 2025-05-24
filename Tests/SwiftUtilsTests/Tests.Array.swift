import Testing
import  SwiftUtils

extension Tests {
    @Suite("Array")
    struct ArrayTests {
        @Test func testRemovingFirstK() {
            let array = [1, 2, 3, 4, 5]
            let result = array.removingFirst(2)
            #expect(result == [3, 4, 5])
        }
        
        @Test func testRemovingFirst() {
            let array = ["a", "b", "c"]
            let result = array.removingFirst()
            #expect(result == ["b", "c"])
        }
        
        @Test func testRemovingLastK() {
            let array = [1, 2, 3, 4, 5]
            let result = array.removingLast(3)
            #expect(result == [1, 2])
        }
        
        @Test func testRemovingLast() {
            let array = ["a", "b", "c"]
            let result = array.removingLast()
            #expect(result == ["a", "b"])
        }
        
        @Test func testRemovingAtIndex() {
            let array = [10, 20, 30, 40]
            let result = array.removing(at: 2)
            #expect(result == [10, 20, 40])
        }
    }
}
