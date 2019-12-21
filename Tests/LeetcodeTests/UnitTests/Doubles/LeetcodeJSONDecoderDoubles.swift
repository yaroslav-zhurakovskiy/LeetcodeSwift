import Leetcode
import Foundation

class LeetcodeJSONDecoderSpy: LeetcodeJSONDecoder {
    struct Call {
        let type: Any.Type
        let from: Data
    }
    private(set) var calls: [Call] = []
    
    var result: Result<Void, Error> = .success(())
    
    func setResultAsSuccess() {
        result = .success(())
    }
    
    func setResultAsFailure(error: Error) {
        result = .failure(error)
    }
    
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
        let call = Call(type: type, from: data)
        calls.append(call)
        switch result {
        case .success:
            return try T.init(from: FakeDecoder())
        case .failure(let error):
            throw error
        }
    }
}
