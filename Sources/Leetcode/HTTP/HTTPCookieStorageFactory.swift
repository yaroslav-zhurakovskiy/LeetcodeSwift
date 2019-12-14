import Foundation

public protocol HTTPCookieStorageFactory {
    func create() -> HTTPCookieStorage
}

public struct HTTPCookieStorageFactoryImpl: HTTPCookieStorageFactory {
    private let groupContainerIdentifier: String?
    
    @available(iOS 9.0, *)
    @available(OSX 10.11, *)
    public init(groupContainerIdentifier: String) {
        self.groupContainerIdentifier = groupContainerIdentifier
    }
    
    public init() {
        self.groupContainerIdentifier = nil
    }
    
    public func create() -> HTTPCookieStorage {
        if #available(OSX 10.11, *), #available(iOS 9.0, *) {
            return createUsingTonainerIdentifier()
        } else {
            return .shared
        }
    }
    
    @available(OSX 10.11, *)
    @available(iOS 9.0, *)
    private func createUsingTonainerIdentifier() -> HTTPCookieStorage {
        if let id = groupContainerIdentifier {
            return .sharedCookieStorage(forGroupContainerIdentifier: id)
        } else {
            return .shared
        }
    }
}

public struct HTTPCookieStorageFactoryHolder {
    private init() { }
    
    public static var current: HTTPCookieStorageFactory = HTTPCookieStorageFactoryImpl()
}
