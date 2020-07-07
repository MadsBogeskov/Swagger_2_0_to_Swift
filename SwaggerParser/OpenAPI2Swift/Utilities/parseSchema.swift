import OpenAPI_2_0_Parser

func parse(schema: Schema, allDefinitions: [String: Schema]) -> [SwiftProperty] {
    let subschemaProperties = (schema.allOf ?? []).compactMap { allOf -> [SwiftProperty]? in
        switch allOf.value {
        case .reference(let ref):
            guard let definitionName = ref.components(separatedBy: "/").last else { fatalError("Failed to find name of referenced definition") }
            guard let referencedDefinition = allDefinitions[definitionName] else { fatalError("Failed to find referenced definition: \(definitionName)") }
            return parse(schema: referencedDefinition, allDefinitions: allDefinitions)
        case .node(let element):
            return parse(properties: element.properties, required: element.required ?? [])
        }
    }.flatMap { $0 }

    let properties = parse(properties: schema.properties, required: schema.required ?? [])

    return properties + subschemaProperties
}
