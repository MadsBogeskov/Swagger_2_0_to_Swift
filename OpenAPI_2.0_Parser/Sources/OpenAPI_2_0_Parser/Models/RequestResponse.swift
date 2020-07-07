public struct RequestResponse: Decodable {
    public let ref: String?
    public let description: String?
    public let schema: Reference?

    enum CodingKeys: String, CodingKey {
        case ref = "$ref"
        case description
        case schema
    }
}
