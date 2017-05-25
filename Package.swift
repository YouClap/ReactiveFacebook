import PackageDescription

let package = Package(
    name: "ReactiveFacebook",
    dependencies: [
        .Package(url: "https://github.com/ReactiveCocoa/ReactiveSwift.git", majorVersion: 1)
    ]
)
