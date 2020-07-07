import Foundation
import Yams

public enum SwaggerError: Error {
    case fileNotFound
    case corruptFile
}

public struct Swagger {
    public let root: SwaggerRoot

    public init (from path: String, fileManager: FileManager = FileManager.default) throws {
        guard let swaggerFileData = fileManager.contents(atPath: path) else {
            throw SwaggerError.fileNotFound
        }

        guard let ymlString = String(data: swaggerFileData, encoding: .utf8) else {
            throw SwaggerError.corruptFile
        }

        root = try YAMLDecoder().decode(SwaggerRoot.self, from: ymlString)
    }
}
