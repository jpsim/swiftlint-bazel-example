load("@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:xcodeproj.bzl", "xcodeproj")

xcodeproj(
    name = "swiftlint_xcodeproj",
    build_mode = "bazel",
    project_name = "SwiftLint",
    tags = ["manual"],
    top_level_targets = [
        "@SwiftLint//:swiftlint",
        "@SwiftLint//:SwiftLintFramework",
        "@SwiftLint//Tests:ExtraRulesTests",
    ],
)
