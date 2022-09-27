load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:defs.bzl",
    "xcode_schemes",
    "xcodeproj",
)

xcodeproj(
    name = "swiftlint_xcodeproj",
    project_name = "SwiftLint",
    schemes = [
        xcode_schemes.scheme(
            name = "SwiftLint",
            launch_action = xcode_schemes.launch_action(
                "@SwiftLint//:swiftlint",
                args = [
                    "--progress",
                ],
            ),
            build_action = xcode_schemes.build_action(
                targets = [
                    "@SwiftLint//:swiftlint",
                ],
            ),
            test_action = xcode_schemes.test_action([
                "@SwiftLint//Tests:ExtraRulesTests",
            ]),
        ),
    ],
    top_level_targets = [
        "@SwiftLint//:swiftlint",
        "@SwiftLint//Tests:ExtraRulesTests",
    ],
)
