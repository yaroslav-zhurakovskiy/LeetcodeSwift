extension ResponseBodyStub {
    static let createSessionSuccess: ResponseBodyStub =
"""
{
  "sessions": [
    {
      "id": 1,
      "is_active": true,
      "total_acs": 1,
      "name": "name",
      "ac_questions": 1,
      "submitted_questions": 1,
      "total_submitted": 1
    }
  ],
  "is_full": true
}
"""
}
