//
//  Tests.JSON.JSONEncoder
//  swift-utils
//
//  Created by me on 24/05/2025.
//
import Foundation
import SwiftUtils
import Testing

extension Tests.Codable {
    @Suite("StringEncoded")
    struct StringEncoded {
        @Test func testValidEncodeDecode() throws {
            struct TestData: Codable {
                @SwiftUtils.StringEncoded var value: Int
            }

            let json = #"{"value":"789"}"#.data(using: .utf8)!
            let decoded = try JSONDecoder().decode(TestData.self, from: json)
            #expect(decoded.value == TestData(value: 789).value)

            let encodedData = try JSONEncoder().encode(TestData(value: 321))
            let encodedString = String(data: encodedData, encoding: .utf8)!
            #expect(encodedString.contains("\"value\":\"321\""))
        }

        @Test func testInvalidDecodeThrows() throws {
            struct TestData: Codable {
                @SwiftUtils.StringEncoded var value: Int
            }
            let json = #"{"value":"notanumber"}"#.data(using: .utf8)!
            do {
                _ = try JSONDecoder().decode(TestData.self, from: json)
                #expect((false))
            } catch {
                #expect(true)
            }
        }

        @Test func testOptionalEncodeDecodeWithValue() throws {
            struct TestData: Codable {
                @SwiftUtils.OptionalStringEncoded var value: Double?
            }
            let json = #"{"value":"42.5"}"#.data(using: .utf8)!
            let decoded = try JSONDecoder().decode(TestData.self, from: json)
            #expect(decoded.value == TestData(value: 42.5).value)

            let encodedData = try JSONEncoder().encode(TestData(value: 84.2))
            let encodedString = String(data: encodedData, encoding: .utf8)!
            #expect(encodedString.contains("\"value\":\"84.2\""))
        }

        @Test func testOptionalEncodeDecodeNil() throws {
            struct TestData: Codable {
                @SwiftUtils.OptionalStringEncoded var value: Int?
            }
            let json = #"{"value":null}"#.data(using: .utf8)!
            let decoded = try JSONDecoder().decode(TestData.self, from: json)
            #expect(decoded.value == TestData(value: nil).value)

            let encodedData = try JSONEncoder().encode(TestData(value: nil))
            let encodedString = String(data: encodedData, encoding: .utf8)!
            #expect(encodedString.contains("\"value\":null"))
        }

        @Test func testBoolEncodeDecode() throws {
            struct TestData: Codable {
                @SwiftUtils.StringEncoded var value: Bool
            }

            let jsonTrue = #"{"value":"True"}"#.data(using: .utf8)!
            let decodedTrue = try JSONDecoder().decode(TestData.self, from: jsonTrue)
            #expect(decodedTrue.value == TestData(value: true).value)

            let encodedFalseData = try JSONEncoder().encode(TestData(value: false))
            let encodedFalseString = String(data: encodedFalseData, encoding: .utf8)!
            #expect(encodedFalseString.contains("\"value\":\"false\""))
        }
    }
}
