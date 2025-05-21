public extension Optional {
    func asyncFlatMap<U>(_ transform: (Wrapped) async throws -> U?) async rethrows -> U? {
        guard let value = self else {
            return nil
        }

        return try await transform(value)
    }
}
