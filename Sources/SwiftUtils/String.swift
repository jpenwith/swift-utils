public extension String {
    var nilIfEmpty: String? {
        isEmpty ? nil : self
    }
}

extension String: AnyType {}
