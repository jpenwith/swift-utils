extension Sequence {
    public func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            let transformed = try await transform(element)
            values.append(transformed)
        }

        return values
    }
}

extension Sequence {
    public func asyncForEach(
        _ body: (Element) async throws -> Void
    ) async rethrows {
        for element in self {
            try await body(element)
        }
    }
}

extension Sequence {
    public func asyncCompactMap<T>(
        _ transform: (Element) async throws -> T?
    ) async rethrows -> [T] {
        var values = [T]()
        for element in self {
            if let value = try await transform(element) {
                values.append(value)
            }
        }
        return values
    }
}


extension Sequence {
    public func asyncReduce<Result>(
        _ initialResult: Result,
        _ nextPartialResult: ((Result, Element) async throws -> Result)
    ) async rethrows -> Result {
        var result = initialResult
        for element in self {
            result = try await nextPartialResult(result, element)
        }
        return result
    }
}

extension Sequence {
    public func sorted<T: Comparable>(on value: @escaping (Element) -> T) -> [Element] {
        sorted { value($0) < value($1) }
    }
}

extension Sequence {
    public func sorted<T: Comparable>(on keyPath: KeyPath<Element, T>) -> [Element] {
        sorted { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }
}
