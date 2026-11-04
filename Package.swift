// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "RyeWaterCycles",
    platforms: [.macOS(.v13)],
    dependencies: [
        // Pinned to a known commit of Ignite so the build stays reproducible.
        .package(url: "https://github.com/twostraws/Ignite.git", revision: "f97f33c734b3eb1862d5dc92b4a9c913cf24e3b5")
    ],
    targets: [
        .executableTarget(
            name: "RyeWaterCycles",
            dependencies: ["Ignite"]
        )
    ]
)
