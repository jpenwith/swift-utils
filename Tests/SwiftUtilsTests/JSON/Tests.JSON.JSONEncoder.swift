//
//  Tests.JSON.JSONEncoder
//  swift-utils
//
//  Created by me on 24/05/2025.
//
import Foundation
import SwiftUtils
import Testing

extension Tests.JSON {
    @Suite("JSONEncoder")
    struct JSONEncoder {
        @Test func testDefaultInit() {
            let encoder = Foundation.JSONEncoder()
            #expect(encoder.outputFormatting == [])
            if case .deferredToDate = encoder.dateEncodingStrategy {
                #expect(true)
            }
            else {
                #expect((false))
            }

            if case .base64 = encoder.dataEncodingStrategy {
                #expect(true)
            }
            else {
                #expect((false))
            }

            if case .throw = encoder.nonConformingFloatEncodingStrategy {
                #expect(true)
            }
            else {
                #expect((false))
            }

            if case .useDefaultKeys = encoder.keyEncodingStrategy {
                #expect(true)
            }
            else {
                #expect((false))
            }
        }

        @Test func testCustomInit() {
            let encoder = Foundation.JSONEncoder(
                outputFormatting: [.prettyPrinted, .sortedKeys],
                dateEncodingStrategy: .iso8601,
                dataEncodingStrategy: .base64,
                nonConformingFloatEncodingStrategy: .convertToString(
                    positiveInfinity: "inf",
                    negativeInfinity: "-inf",
                    nan: "nan"
                ),
                keyEncodingStrategy: .convertToSnakeCase
            )
            #expect(encoder.outputFormatting.contains(.prettyPrinted))
            #expect(encoder.outputFormatting.contains(.sortedKeys))

            if case .iso8601 = encoder.dateEncodingStrategy {
                #expect(true)
            }
            else {
                #expect((false))
            }

            if case .base64 = encoder.dataEncodingStrategy {
                #expect(true)
            }
            else {
                #expect((false))
            }

            if
                case .convertToString(let positiveInfinity, let negativeInfinity, let nan) = encoder.nonConformingFloatEncodingStrategy,
                positiveInfinity == "inf",
                negativeInfinity == "-inf",
                nan == "nan"
            {
                #expect(true)
            }
            else {
                #expect((false))
            }

            if case .convertToSnakeCase = encoder.keyEncodingStrategy {
                #expect(true)
            }
            else {
                #expect((false))
            }
        }
    }

}
