public struct Path: Decodable {
    public let get: Request?
    public let post: Request?
    public let parameters: [Node<Parameter>]?

    enum CodingKeys: String, CodingKey {
        case get
        case post
        case parameters
    }

    public init(from decoder: Decoder) throws {
        let con = try decoder.container(keyedBy: CodingKeys.self)
        self.get = try con.decodeIfPresent(Request.self, forKey: .get)
        self.post = try con.decodeIfPresent(Request.self, forKey: .post)
        if con.contains(.parameters) {
            var params = [Node<Parameter>]()
            var parameterContainer = try con.nestedUnkeyedContainer(forKey: .parameters)
            while parameterContainer.currentIndex < parameterContainer.count ?? 0 {
                if let reference = try? parameterContainer.decode(Reference.self) {
                    params.append(.reference(reference.ref))
                } else if let parameter = try? parameterContainer.decode(Parameter.self) {
                    params.append(.node(parameter))
                } else {
                    fatalError("Unknown object")
                }
            }
            self.parameters = params
        } else {
            self.parameters = nil
        }
    }
}
