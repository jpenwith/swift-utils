//
//  Data.swift
//  swift-utils
//
//  Created by James Penwith on 05/04/2026.
//

import Foundation

public extension Data {
    init?(base64URLEncoded: String, options: Base64DecodingOptions = []) {
        let base64Encoded = base64URLEncoded
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
            .applying {
                $0 + String(repeating: "=", count: 4 - ($0.count % 4))
            }

        self.init(base64Encoded: base64Encoded, options: options)
    }
}
