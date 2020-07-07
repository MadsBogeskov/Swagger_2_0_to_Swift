import OpenAPI_2_0_Parser

func parse(properties: [String: NodeWrapper<SchemaProperty>]?, required: [String]) -> [SwiftProperty] {
    guard let properties = properties else { return [] }

    return properties.compactMap { (key, value) -> [SwiftProperty]? in
        switch value.value {
        case .reference(let ref):
            let typeName = ref.components(separatedBy: "/").last ?? ""
            return [SwiftProperty(required: required.contains(key), name: key, type: typeName, documentation: nil)]
        case .node(let element):
            let description = element.description
            if let properties = element.properties {
                return parse(properties: properties, required: required)
            } else {
                let type = element.getType
                return [SwiftProperty(required: required.contains(key), name: key, type: type, documentation: description)]
            }
        }
    }.flatMap { $0 }
}
