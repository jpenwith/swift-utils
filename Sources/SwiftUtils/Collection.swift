extension Collection where Element: Sendable {
    public func concurrentMap<T: Sendable>(
        _ transform: @Sendable @escaping (Element) async throws -> T
    ) async rethrows -> [T] {
        try await withThrowingTaskGroup(of: (Int, T).self) { group in
            for (index, element) in self.enumerated() {
                group.addTask {
                    (index, try await transform(element))
                }
            }

            var results = Array<T?>(repeating: nil, count: self.count)
            for try await (index, value) in group {
                results[index] = value
            }
            return results.compactMap { $0 }
        }
    }

    public func concurrentForEach(
        _ body: @Sendable @escaping (Element) async throws -> Void
    ) async rethrows {
        try await withThrowingTaskGroup(of: Void.self) { group in
            for element in self {
                group.addTask {
                    try await body(element)
                }
            }
            try await group.waitForAll()
        }
    }

    public func concurrentCompactMap<T: Sendable>(
        _ transform: @Sendable @escaping (Element) async throws -> T?
    ) async rethrows -> [T] {
        try await withThrowingTaskGroup(of: (Int, T?).self) { group in
            for (index, element) in self.enumerated() {
                group.addTask {
                    (index, try await transform(element))
                }
            }
            
            var results = Array<T?>(repeating: nil, count: self.count)
            for try await (index, value) in group {
                results[index] = value
            }
            return results.compactMap { $0 }
        }
    }


    public subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
