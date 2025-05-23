//
//  JSONDecoder
//  swift-utils
//
//  Created by me on 23/05/2025.
//
import Foundation


extension JSONDecoder {
    public convenience init(
        dateDecodingStrategy: DateDecodingStrategy? = nil,
        dataDecodingStrategy: DataDecodingStrategy? = nil,
        nonConformingFloatDecodingStrategy: NonConformingFloatDecodingStrategy? = nil,
        keyDecodingStrategy: KeyDecodingStrategy? = nil
    ) {
        self.init()

        if let dateDecodingStrategy {
            self.dateDecodingStrategy = dateDecodingStrategy
        }

        if let dataDecodingStrategy {
            self.dataDecodingStrategy = dataDecodingStrategy
        }

        if let nonConformingFloatDecodingStrategy {
            self.nonConformingFloatDecodingStrategy = nonConformingFloatDecodingStrategy
        }

        if let keyDecodingStrategy {
            self.keyDecodingStrategy = keyDecodingStrategy
        }
    }
}
