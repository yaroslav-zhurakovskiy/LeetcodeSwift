//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

public struct InterpretSolutionResponse: Decodable {
    public let interpret_id: String
    public let test_case: String
}

public enum InterpretSolutionError: Error {
    case paidResourceAccess
    case generic(Error)
}
