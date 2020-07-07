public struct Info: Decodable {
    public let version: String
    public let title: String
    public let description: String
    public let termsOfService: String
    public let contact: Contact
    public let license: License
}
