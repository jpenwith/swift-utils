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
        #expect(decoder.dateDecodingStrategy == .deferredToDate)
        #expect(decoder.dataDecodingStrategy == .base64)
        #expect(decoder.nonConformingFloatDecodingStrategy == .throw)
        #expect(decoder.keyDecodingStrategy == .useDefaultKeys)
    }

    @Test func testCustomInit() {
        let customStrategy = NonConformingFloatDecodingStrategy.convertFromString(
            positiveInfinity: "inf",
            negativeInfinity: "-inf",
            nan: "nan"
        )
        let decoder = JSONDecoder(
            dateDecodingStrategy: .iso8601,
            dataDecodingStrategy: .deferredToData,
            nonConformingFloatDecodingStrategy: customStrategy,
            keyDecodingStrategy: .convertFromSnakeCase
        )
        #expect(decoder.dateDecodingStrategy == .iso8601)
        #expect(decoder.dataDecodingStrategy == .deferredToData)
        #expect(decoder.nonConformingFloatDecodingStrategy == customStrategy)
        #expect(decoder.keyDecodingStrategy == .convertFromSnakeCase)
    }
}
