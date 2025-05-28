//
//  StringEncoded
//  swift-utils
//
//  Created by me on 28/05/2025.
//

@propertyWrapper
public struct StringEncoded<Value: LosslessStringConvertible & Codable> {
    public var wrappedValue: Value

    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
}

extension StringEncoded: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self).lowercased()
        guard let value = Value(string) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid \(Value.self) string: \(string)")
        }
        self.wrappedValue = value
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue.description)
    }
}

@propertyWrapper
public struct OptionalStringEncoded<Value: LosslessStringConvertible & Codable>: Codable {
    public var wrappedValue: Value?

    public init(wrappedValue: Value?) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if container.decodeNil() {
            self.wrappedValue = nil
            return
        }

        let string = try container.decode(String.self).lowercased()
        self.wrappedValue = Value(string)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let value = wrappedValue {
            try container.encode(value.description)
        } else {
            try container.encodeNil()
        }
    }
}
