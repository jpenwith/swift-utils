//
//  Duration
//  swift-utils
//
//  Created by me on 23/05/2025.
//

extension Duration {
    
    /// Construct a `Duration` given a number of minutes represented as a
    /// `BinaryInteger`.
    ///
    ///       let d: Duration = .minutes(77)
    ///
    /// - Returns: A `Duration` representing a given number of minutes.
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    @inlinable public static func minutes<T>(_ minutes: T) -> Duration where T : BinaryInteger {
        .seconds(minutes * 60)
    }

    /// Construct a `Duration` given a number of hours represented as a
    /// `BinaryInteger`.
    ///
    ///       let d: Duration = .hours(77)
    ///
    /// - Returns: A `Duration` representing a given number of hours.
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    @inlinable public static func hours<T>(_ hours: T) -> Duration where T : BinaryInteger {
        .minutes(hours * 60)
    }

    /// Construct a `Duration` given a number of minutes days as a
    /// `BinaryInteger`.
    ///
    ///       let d: Duration = .days(77)
    ///
    /// - Returns: A `Duration` representing a given number of days.
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    @inlinable public static func days<T>(_ days: T) -> Duration where T : BinaryInteger {
        .hours(days * 24)
    }
}
