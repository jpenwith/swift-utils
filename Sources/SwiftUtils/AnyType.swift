//
//  AnyType.swift
//  swift-utils
//
//  Created by James Penwith on 05/04/2026.
//

public protocol AnyType {}

public extension AnyType {
    func applying<T>(_ closure: (Self) -> T) -> T {
        closure(self)
    }
}
