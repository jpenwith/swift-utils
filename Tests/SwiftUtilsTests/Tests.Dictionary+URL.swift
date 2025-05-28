import Foundation

extension Tests {
    @Suite("Dictionary.urlQueryItems")
    struct DictionaryURLQueryItems {
        @Test func testEmptyDictionary() {
            let dict: [String: Int?] = [:]
            let result = dict.urlQueryItems
            #expect(result.isEmpty)
        }

        @Test func testNilValuesOmitted() {
            let dict: [String: String?] = ["a": "apple", "b": nil, "c": "cherry"]
            let result = dict.urlQueryItems
            #expect(result.count == 2)
            #expect(result[0].name == "a")
            #expect(result[0].value == "apple")
            #expect(result[1].name == "c")
            #expect(result[1].value == "cherry")
        }

        @Test func testValueStringConvertible() {
            let dict: [String: Double?] = ["pi": 3.14, "nan": nil]
            let result = dict.urlQueryItems
            #expect(result.count == 1)
            #expect(result[0] == URLQueryItem(name: "pi", value: "3.14"))
        }
    }
}
