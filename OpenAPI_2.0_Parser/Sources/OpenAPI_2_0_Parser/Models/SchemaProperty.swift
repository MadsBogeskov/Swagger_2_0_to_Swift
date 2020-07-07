public struct SchemaProperty: Decodable {
    public let type: PropertyType
    public let description: String?
    public let items: Reference?
    public let `enum`: [String]?
    public let format: PropertyFormat?
    /// used for object references in a property
    public let properties: [String: NodeWrapper<SchemaProperty>]?
}
