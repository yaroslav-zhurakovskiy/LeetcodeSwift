//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

class TestError: Error {
    private init() { }
    
    static let shared = TestError()
}
