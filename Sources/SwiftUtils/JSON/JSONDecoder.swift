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


extension JSONDecoder.DateDecodingStrategy {
    public static func multipleFormatted(_ dateFormatters: DateFormatter ...) -> Self {
        .custom({ decoder in
            let container = try decoder.singleValueContainer()

            let dateString = try container.decode(String.self)
            
            for dateFormatter in dateFormatters {
                if let date = dateFormatter.date(from: dateString) {
                    return date
                }
            }

            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Date string \(dateString) not matching any of the provided date formatters")
        })
    }
}
