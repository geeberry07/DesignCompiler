import Foundation

// MARK: - MenuItem
struct MenuItem: Codable, Equatable, Hashable {
    let id: UUID
    let title: String
    let description: String?
    let price: Double

    enum CodingKeys: String, CodingKey {
        case id, title, description, price
    }
}

// MARK: - ProjectError
struct ProjectError: Codable, Equatable, Hashable {
    let code: Int
    let message: String

    enum CodingKeys: String, CodingKey {
        case code, message
    }
}

// MARK: - RawRepresentable for AppStorage persistence
extension MenuItem: RawRepresentable {
    typealias RawValue = String

    init?(rawValue: String) {
        let components = rawValue.split(separator: "|")
        guard components.count == 4,
              let id = UUID(uuidString: String(components[0])),
              let price = Double(components[3]) else { return nil }
        self.id = id
        self.title = String(components[1])
        self.description = (components[2] == "nil") ? nil : String(components[2])
        self.price = price
    }

    var rawValue: String {
        return "\(id.uuidString)|\(title)|\(description ?? "nil")|\(price)"
    }
}

extension ProjectError: RawRepresentable {
    typealias RawValue = String

    init?(rawValue: String) {
        let components = rawValue.split(separator: "|")
        guard components.count == 2,
              let code = Int(components[0]) else { return nil }
        self.code = code
        self.message = String(components[1])
    }

    var rawValue: String {
        return "\(code)|\(message)"
    }
}