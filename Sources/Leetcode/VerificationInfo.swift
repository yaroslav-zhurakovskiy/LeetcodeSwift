//
//  File 2.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

public struct VerificationInfo: Decodable {
    public let compile_error: String?
    public let elapsed_time: Int?
    public let full_compile_error: String?
    public let lang: String?
    public let memory: Int?
    public let memory_percentile: Int?
    public let pretty_lang: String?
    public let question_id: Int?
    public let run_success: Bool?
    public let runtime_percentile: String?
    public let state: String?
    public let status_code: Int?
    public let status_memory: String?
    public let status_msg: String?
    public let status_runtime: String?
    public let submission_id: String?
    public let task_finish_time: Int?
    public let total_correct: String?
    public let total_testcases: String?
}
