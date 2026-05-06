//
//  Task
//  swift-utils
//
//  Created by me on 21/04/2026.
//

public func task(_ operation: @escaping @Sendable () async throws -> Void, withErrorHandler errorHandler: @escaping @Sendable (Swift.Error) -> Void) {
    Task {
        do {
            try await operation()
        }
        catch {
            errorHandler(error)
        }
    }
}
