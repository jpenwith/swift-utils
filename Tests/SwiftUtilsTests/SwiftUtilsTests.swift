import Foundation
import SwiftUtils
import Testing


@Suite("Duration")
struct Duration {
    @Test func testMinutes() {
        #expect(Swift.Duration.minutes(77) == .seconds(4620))
    }

    @Test func testHours() {
        #expect(Swift.Duration.hours(2) == .minutes(120))
    }

    @Test func testDays() {
        #expect(Swift.Duration.days(3) == .hours(72))
    }
}

@Suite("JSONEncoder")
struct JSONEncoderSuite {
    @Test func testDefaultInit() {
        let encoder = JSONEncoder()
        #expect(encoder.outputFormatting == [])
        if case .deferredToDate = encoder.dateEncodingStrategy {
            #expect(true)
        }
        else {
            #expect(false)
        }

        if case .base64 = encoder.dataEncodingStrategy {
            #expect(true)
        }
        else {
            #expect(false)
        }

        if case .throw = encoder.nonConformingFloatEncodingStrategy {
            #expect(true)
        }
        else {
            #expect(false)
        }

        if case .useDefaultKeys = encoder.keyEncodingStrategy {
            #expect(true)
        }
        else {
            #expect(false)
        }
    }

    @Test func testCustomInit() {
        let encoder = JSONEncoder(
            outputFormatting: [.prettyPrinted, .sortedKeys],
            dateEncodingStrategy: .iso8601,
            dataEncodingStrategy: .base64URL,
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
            #expect(false)
        }

        if case .base64URL = encoder.dataEncodingStrategy {
            #expect(true)
        }
        else {
            #expect(false)
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
            #expect(false)
        }

        if case .convertToSnakeCase = encoder.keyEncodingStrategy {
            #expect(true)
        }
        else {
            #expect(false)
        }
    }
}

@Suite("Optional")
struct OptionalSuite {
    @Test func testAsyncFlatMapWithValue() async throws {
        let initial: Int? = 3
        let result = await initial.asyncFlatMap { value in String(value) }
        #expect(result == "3")
    }

    @Test func testAsyncFlatMapWithNil() async throws {
        let initial: Int? = nil
        let result = await initial.asyncFlatMap { _ in "ignored" }
        #expect(result == nil)
    }
}

@Suite("String")
struct StringSuite {
    @Test func testNilIfEmptyWithEmptyString() {
        let empty = ""
        let result = empty.nilIfEmpty
        #expect(result == nil)
    }

    @Test func testNilIfEmptyWithNonEmptyString() {
        let nonEmpty = "hello"
        let result = nonEmpty.nilIfEmpty
        #expect(result == "hello")
    }
}

@Suite("Sequence")
struct SequenceSuite {
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
}

@Suite("JSONDecoder")
struct JSONDecoderSuite {
    @Test func testDefaultInit() {
        let decoder = JSONDecoder()
        
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
        let decoder = JSONDecoder(
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
