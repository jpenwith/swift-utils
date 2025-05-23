//
//  JSONEncoder
//  swift-utils
//
//  Created by me on 23/05/2025.
//
import Foundation


extension JSONEncoder {
    public convenience init(
        outputFormatting: OutputFormatting? = nil,
        dateEncodingStrategy: DateEncodingStrategy? = nil,
        dataEncodingStrategy: DataEncodingStrategy? = nil,
        nonConformingFloatEncodingStrategy: NonConformingFloatEncodingStrategy? = nil,
        keyEncodingStrategy: KeyEncodingStrategy? = nil
    ) {
        self.init()
        
        if let outputFormatting {
            self.outputFormatting = outputFormatting
        }

        if let dateEncodingStrategy {
            self.dateEncodingStrategy = dateEncodingStrategy
        }

        if let dataEncodingStrategy {
            self.dataEncodingStrategy = dataEncodingStrategy
        }

        if let nonConformingFloatEncodingStrategy {
            self.nonConformingFloatEncodingStrategy = nonConformingFloatEncodingStrategy
        }

        if let keyEncodingStrategy {
            self.keyEncodingStrategy = keyEncodingStrategy
        }
    }
}
