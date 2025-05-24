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
    @Suite("JSONDecoder")
    struct JSONDecoder {
        @Test func testDefaultInit() {
            let decoder = Foundation.JSONDecoder()
            
            if case .deferredToDate = decoder.dateDecodingStrategy {
                #expect(true)
            }
            else {
                #expect((false))
            }

            if case .base64 = decoder.dataDecodingStrategy {
                #expect(true)
            }
            else {
                #expect((false))
            }

            if case .throw = decoder.nonConformingFloatDecodingStrategy {
                #expect(true)
            }
            else {
                #expect((false))
            }

            if case .useDefaultKeys = decoder.keyDecodingStrategy {
                #expect(true)
            }
            else {
                #expect((false))
            }
        }

        @Test func testCustomInit() {
            let decoder = Foundation.JSONDecoder(
                dateDecodingStrategy: .iso8601,
                dataDecodingStrategy: .deferredToData,
                nonConformingFloatDecodingStrategy: .convertFromString(
                    positiveInfinity: "inf",
                    negativeInfinity: "-inf",
                    nan: "nan"
                ),
                keyDecodingStrategy: .convertFromSnakeCase
            )
            if case .iso8601 = decoder.dateDecodingStrategy {
                #expect(true)
            }
            else {
                #expect((false))
            }

            if case .deferredToData = decoder.dataDecodingStrategy {
                #expect(true)
            }
            else {
                #expect((false))
            }

            if
                case .convertFromString(let positiveInfinity, let negativeInfinity, let nan) = decoder.nonConformingFloatDecodingStrategy,
                positiveInfinity == "inf",
                negativeInfinity == "-inf",
                nan == "nan"
            {
                #expect(true)
            }
            else {
                #expect((false))
            }

            if case .convertFromSnakeCase = decoder.keyDecodingStrategy {
                #expect(true)
            }
            else {
                #expect((false))
            }

        }
    }
}
