//
//  Misc.swift
//  swift-utils
//
//  Created by James Penwith on 28/07/2025.
//

@discardableResult
public func with<I, O>(_ input: I, handler: (I) -> O) -> O {
    handler(input)
}

@discardableResult
public func with<I1, I2, O>(_ input1: I1, _ input2: I2, handler: (I1, I2) -> O) -> O {
    handler(input1, input2)
}

@discardableResult
public func with<I1, I2, I3, O>(_ input1: I1, _ input2: I2, _ input3: I3, handler: (I1, I2, I3) -> O) -> O {
    handler(input1, input2, input3)
}
