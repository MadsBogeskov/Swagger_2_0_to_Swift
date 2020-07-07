public struct Request: Decodable {
    public let description: String
    public let produces: [String]?
    public let responses: [Int: RequestResponse]
}
