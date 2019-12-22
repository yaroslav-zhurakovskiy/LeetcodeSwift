//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

public struct Session: Decodable {
    public let id: Int
    public let is_active: Bool
    public let total_acs: Int
    public let name: String
    public let ac_questions: Int
    public let submitted_questions: Int
    public let total_submitted: Int
}
