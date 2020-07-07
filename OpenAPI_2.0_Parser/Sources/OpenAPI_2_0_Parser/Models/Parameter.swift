public struct Parameter: Decodable {
    public let name: String
    public let `in`: String
    public let description: String?
    public let required: Bool
    public let type: String
}
