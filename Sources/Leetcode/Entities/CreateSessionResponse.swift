//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

public struct CreateSessionResponse: Decodable {
    public let sessions: [Session]
    public let is_full: Bool
}
