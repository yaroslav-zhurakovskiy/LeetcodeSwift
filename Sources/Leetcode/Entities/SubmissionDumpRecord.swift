//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

public struct SubmissionDumpRecord: Decodable {
    public let id: Int
    public let lang: String
    public let time: String
    public let timestamp: Int
    public let status_display: String
    public let runtime: String
    public let url: String
    public let is_pending: String
    public let title: String
    public let memory: String
    public let code: String
    public let compare_result: String?
}
