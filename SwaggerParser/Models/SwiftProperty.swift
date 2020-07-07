struct SwiftProperty {
    /// is the field not optional
    let required: Bool
    let name: String
    let type: String
    let documentation: String?
}

extension SwiftProperty: CustomStringConvertible {
    var description: String {
        assert(name.count > 0, "No field name found on property")
        assert(type.count > 0, "No type name found on struct named: \(name)")

        var result = ""
        if let documentation = documentation {
            result += "\(defaultSpacing)/// \(documentation)\n"
        }

        result += "\(defaultSpacing)let \(name): \(type)\(required ? "" : "?")"
        return result
    }
}
