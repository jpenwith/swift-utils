//
//  Dictionary+URL
//  swift-utils
//
//  Created by me on 28/05/2025.
//
import Foundation

extension Dictionary where Key == String, Value == Optional<any LosslessStringConvertible> {
    public var urlQueryItems: [URLQueryItem] {
        let allQueryItems: [URLQueryItem?] = map { (name, value) in
            guard let value else {
                return nil
            }
            
            return .init(name: name, value: String(value))
        }
        
        let queryItems = allQueryItems.compactMap { $0 }
        
        return queryItems
    }
}
