extension ResponseBodyStub {
    static let getUserInfoSuccess: ResponseBodyStub = """
    {
        "data": {
            "user": {
                "username": "username",
                "isCurrentUserPremium": true
            }
        }
    }
    """
}
