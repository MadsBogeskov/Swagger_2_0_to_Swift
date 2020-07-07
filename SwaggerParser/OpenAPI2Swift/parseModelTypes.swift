import OpenAPI_2_0_Parser

func parseModelTypes(_ definitions: [String: Schema]) -> [SwiftType] {
    return definitions.map { name, schema in
        let properties = parse(schema: schema, allDefinitions: swagger.root.definitions)

        if let enumType = schema.enum {
            return SwiftEnum(typeName: name, options: enumType)
        } else {
            return SwiftStruct(documentation: schema.description, typeName: name, properties: properties)
        }
    }
}
