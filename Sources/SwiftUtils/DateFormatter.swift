//
//  DateFormatter
//  swift-utils
//
//  Created by me on 23/05/2025.
//
import Foundation


extension DateFormatter {
    public convenience init(
        dateStyle: DateFormatter.Style? = nil,
        timeStyle: DateFormatter.Style? = nil,
        dateFormat: String? = nil,
        locale: Locale? = nil,
        timeZone: TimeZone? = nil,
        calendar: Calendar? = nil
    ) {
        self.init()

        if let dateStyle {
            self.dateStyle = dateStyle
        }

        if let timeStyle {
            self.timeStyle = timeStyle
        }
    
        if let dateFormat {
            self.dateFormat = dateFormat
        }

        if let locale {
            self.locale = locale
        }

        if let timeZone {
            self.timeZone = timeZone
        }

        if let calendar {
            self.calendar = calendar
        }
    }
    
    public convenience init(
        iso8601Format: ISO8601Format = .default
    ) {
        self.init()

        self.dateFormat = iso8601Format.formatString
        self.locale = .init(identifier: "en_US_POSIX")
        self.timeZone = .init(secondsFromGMT: 0)
    }

    public enum ISO8601Format {
        case `default`
        case microseconds
        
        var formatString: String {
            switch self {
                case .default:
                    return "yyyy-MM-dd'T'HH:mm:ssZ"
                case .microseconds:
                    return "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
            }
        }
    }
}
