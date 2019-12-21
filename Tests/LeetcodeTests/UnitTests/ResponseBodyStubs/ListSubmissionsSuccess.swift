extension ResponseBodyStub {
    static let listSubmissionsSuccess: ResponseBodyStub = """
    {
        "submissions_dump": [
            {
                "id": 0,
                "lang": "lang",
                "time": "time",
                "timestamp": 0,
                "status_display": "status_display",
                "runtime": "runtime",
                "url": "url",
                "is_pending": "is_pending",
                "title": "title",
                "memory": "memory",
                "code": "code",
                "compare_result": "compare_result"
            }
        ]
    }
    """
}
