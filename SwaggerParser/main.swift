import OpenAPI_2_0_Parser

let swagger = try! Swagger(from: "/Users/madsbogeskov/Developer/privat/SwaggerNetwork.playground/Resources/spec.swagger")

let models = parseModelTypes(swagger.root.definitions)

print(models.sorted(by: { $0.typeName < $1.typeName }).map { $0.description }.joined(separator: "\n\n"))
