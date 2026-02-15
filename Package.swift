// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "DesignCompiler",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: [
        // Add your dependencies here, e.g.,
        // .package(url: "https://github.com/some/dependency.git", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "DesignCompiler",
            dependencies: []
        )
    ]
)