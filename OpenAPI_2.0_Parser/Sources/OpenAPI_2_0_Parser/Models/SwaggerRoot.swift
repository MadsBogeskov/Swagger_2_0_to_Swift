public struct SwaggerRoot: Decodable {
    public let swagger: String?
    public let info: Info?
    public let consumes: [String]?
    public let produces: [String]?
    public let parameters: [String: Parameter]?
    public let responses: [String: Response]?
    public let definitions: [String: Schema]
    public let paths: [String: Path]?
}
