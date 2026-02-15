// Sources/Core/Models.swift

struct MenuItem {
    var name: String
    var price: Double
}

struct ProjectError: Error {
    var message: String
    var code: Int
}
