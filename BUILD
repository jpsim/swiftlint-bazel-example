load("@rules_xcodeproj//xcodeproj:defs.bzl", "xcodeproj")

xcodeproj(
    name = "swiftlint_xcodeproj",
    project_name = "SwiftLint",
    tags = ["manual"],
    top_level_targets = [
        "@SwiftLint//:swiftlint",
        "@SwiftLint//Tests:ExtraRulesTests",
    ],
)
