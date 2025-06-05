# swift-utils

`swift-utils` is a Swift Package that provides a suite of extensions and helpers to streamline common tasks in Swift projects:

- Array transformations: `removingFirst(_:)`, `removingFirst()`, `removingLast(_:)`, `removingLast()`, `removing(at:)`  
- Dictionary to URL query items conversion  
- Lossless string‐encoded `Codable` property wrappers: `@StringEncoded` and `@OptionalStringEncoded`  
- JSON encoder/decoder convenience initializers and multiple‐formatter decoding strategy  
- `DateFormatter` convenience initializers and ISO8601 support  
- `Duration` constructors: `.minutes(_:)`, `.hours(_:)`, `.days(_:)`
- Async helpers for `Optional` (`asyncFlatMap`) and `Sequence` (`asyncMap`, `asyncCompactMap`, `asyncForEach`, `asyncReduce`)
- Collection safe subscripting: `subscript(safe:)`
- String extension: `nilIfEmpty`

## Requirements

- Swift 5.7 or later  
- macOS 13.0 or later (or corresponding platform versions)

## Installation

Add this package to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/yourusername/swift-utils.git", from: "1.0.0")
```

Then add `"SwiftUtils"` to your target’s dependencies.

## Usage

```swift
import SwiftUtils

let trimmed = [1, 2, 3, 4].removingFirst(2)             // [3, 4]
let queryItems = ["key": 42].urlQueryItems              // [URLQueryItem(name: "key", value: "42")]

@StringEncoded var count: Int = 10
// Encodes as a JSON string and decodes back losslessly

let decoder = JSONDecoder(dateDecodingStrategy: .multipleFormatted(
    DateFormatter(iso8601Format: .default),
    DateFormatter(dateFormat: "yyyy-MM-dd")
))

let element = [1, 2, 3][safe: 5]                     // nil
```

## License

This project is released under the MIT License.  
