class TestError: Error {
    private init() { }
    
    static let shared = TestError()
}
