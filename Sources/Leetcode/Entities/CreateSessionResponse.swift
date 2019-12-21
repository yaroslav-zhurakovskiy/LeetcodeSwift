public struct CreateSessionResponse: Decodable {
    public let sessions: [Session]
    public let is_full: Bool
}
