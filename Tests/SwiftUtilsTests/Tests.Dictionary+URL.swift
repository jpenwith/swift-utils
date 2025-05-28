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

        @Test func testNilValuesOmitted() throws {
            let dict: [Swift.String: Swift.String?] = ["a": "apple", "b": nil, "c": "cherry"]
            let result = (dict as [Swift.String: Swift.Optional<any LosslessStringConvertible>]).urlQueryItems
            #expect(result.count == 2)
            
            let aQueryItem = try #require(result.first { $0.name == "a" })
            #expect(aQueryItem.value == "apple")
            let cQueryItem = try #require(result.first { $0.name == "c" })
            #expect(cQueryItem.value == "cherry")
        }

        @Test func testValueStringConvertible() {
            let dict: [Swift.String: Double?] = ["pi": 3.14, "nan": nil]
            let result = (dict as [Swift.String: Swift.Optional<any LosslessStringConvertible>]).urlQueryItems
            #expect(result.count == 1)
            #expect(result[0] == URLQueryItem(name: "pi", value: "3.14"))
        }
    }
}
