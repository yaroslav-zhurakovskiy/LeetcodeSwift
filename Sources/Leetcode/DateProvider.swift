import Foundation

public protocol DateProvider {
    var now: Date { get }
}

public struct SystemDateProvider: DateProvider {
    public var now: Date {
        return Date()
    }
}

public struct DateProviderHolder {
    public static var current: DateProvider = SystemDateProvider()
}
