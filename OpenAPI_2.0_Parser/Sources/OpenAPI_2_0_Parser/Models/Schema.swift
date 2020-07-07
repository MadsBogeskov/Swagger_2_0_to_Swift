public struct Schema: Decodable {
    public let type: PropertyType?
    public let required: [String]?
    public let description: String?
    public let properties: [String: NodeWrapper<SchemaProperty>]?
    public let allOf: [NodeWrapper<Schema>]?
    public let `enum`: [String]?
}
