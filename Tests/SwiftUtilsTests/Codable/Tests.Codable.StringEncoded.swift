extension Tests {
    @Suite("StringEncoded")
    struct StringEncoded {
        @Test func testValidEncodeDecode() throws {
            struct TestData: Codable, Equatable {
                @StringEncoded var value: Int
            }
            let json = #"{"value":"789"}"#.data(using: .utf8)!
            let decoded = try JSONDecoder().decode(TestData.self, from: json)
            #expect(decoded == TestData(value: 789))

            let encodedData = try JSONEncoder().encode(TestData(value: 321))
            let encodedString = String(data: encodedData, encoding: .utf8)!
            #expect(encodedString.contains("\"value\":\"321\""))
        }

        @Test func testInvalidDecodeThrows() throws {
            struct TestData: Codable {
                @StringEncoded var value: Int
            }
            let json = #"{"value":"notanumber"}"#.data(using: .utf8)!
            do {
                _ = try JSONDecoder().decode(TestData.self, from: json)
                #expect(false)
            } catch {
                #expect(true)
            }
        }

        @Test func testOptionalEncodeDecodeWithValue() throws {
            struct TestData: Codable, Equatable {
                @OptionalStringEncoded var value: Double?
            }
            let json = #"{"value":"42.5"}"#.data(using: .utf8)!
            let decoded = try JSONDecoder().decode(TestData.self, from: json)
            #expect(decoded == TestData(value: 42.5))

            let encodedData = try JSONEncoder().encode(TestData(value: 84.2))
            let encodedString = String(data: encodedData, encoding: .utf8)!
            #expect(encodedString.contains("\"value\":\"84.2\""))
        }

        @Test func testOptionalEncodeDecodeNil() throws {
            struct TestData: Codable, Equatable {
                @OptionalStringEncoded var value: Int?
            }
            let json = #"{"value":null}"#.data(using: .utf8)!
            let decoded = try JSONDecoder().decode(TestData.self, from: json)
            #expect(decoded == TestData(value: nil))

            let encodedData = try JSONEncoder().encode(TestData(value: nil))
            let encodedString = String(data: encodedData, encoding: .utf8)!
            #expect(encodedString.contains("\"value\":null"))
        }
    }
}
