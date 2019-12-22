extension ResponseBodyStub {
    static let checkInterpretSolutionPending: ResponseBodyStub =
    """
{
    "state": "PENDING"
}
"""
    static let checkInterpretSolutionStarted: ResponseBodyStub =
    """
{
    "state": "STARTED"
}
"""
    static let checkInterpretSolutionSuccess: ResponseBodyStub =
    """
{
  "status_code": 1,
  "lang": "lang",
  "run_success": true,
  "compile_error": "compile_error",
  "full_compile_error": "full_compile_error",
  "status_runtime": "status_runtime",
  "memory": 1,
  "code_answer": ["code_answer_1"],
  "code_output": [],
  "task_finish_time": 1,
  "elapsed_time": 1,
  "total_correct": null,
  "total_testcases": null,
  "runtime_percentile": null,
  "status_memory": "status_memory",
  "memory_percentile": null,
  "pretty_lang": "pretty_lang",
  "submission_id": "submission_id",
  "status_msg": "status_msg",
  "state": "SUCCESS"
}
"""
    
    static let checkInterpretSolutionStatusMissing: ResponseBodyStub = ""
    
}
