import Foundation
import Testing

extension Tests {
    @Suite("Dictionary+URL")
    struct DictionaryURL {
        @Test func testEmptyDictionary() {
            let dict: [Swift.String: Int?] = [:]
            let result = (dict as [Swift.String: Swift.Optional<any LosslessStringConvertible>]).urlQueryItems
            #expect(result.isEmpty)
        }

        @Test func testNilValuesOmitted() {
            let dict: [Swift.String: Swift.String?] = ["a": "apple", "b": nil, "c": "cherry"]
            let result = (dict as [Swift.String: Swift.Optional<any LosslessStringConvertible>]).urlQueryItems
            #expect(result.count == 2)
            #expect(result[0].name == "a")
            #expect(result[0].value == "apple")
            #expect(result[1].name == "c")
            #expect(result[1].value == "cherry")
        }

        @Test func testValueStringConvertible() {
            let dict: [Swift.String: Double?] = ["pi": 3.14, "nan": nil]
            let result = (dict as [Swift.String: Swift.Optional<any LosslessStringConvertible>]).urlQueryItems
            #expect(result.count == 1)
            #expect(result[0] == URLQueryItem(name: "pi", value: "3.14"))
        }
    }
}
