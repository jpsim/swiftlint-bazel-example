load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "90e3b5e8ff942be134e64a83499974203ea64797fd620eddeb71b3a8e1bff681",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/1.1.2/rules_apple.1.1.2.tar.gz",
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

http_archive(
    name = "SwiftLint",
    sha256 = "3c77d45316e5dc052bd58b4c39844fc57d7e7a27f23121f204f73426bce5ccb2",
    strip_prefix = "SwiftLint-cd8961a807f86cf847fe11eaf468cf511eae25d9",
    url = "https://github.com/realm/SwiftLint/archive/cd8961a807f86cf847fe11eaf468cf511eae25d9.tar.gz",
)

local_repository(
    name = "swiftlint_extra_rules",
    path = "swiftlint_extra_rules",
)

load("@SwiftLint//bazel:repos.bzl", "swiftlint_repos")

swiftlint_repos()

load("@SwiftLint//bazel:deps.bzl", "swiftlint_deps")

swiftlint_deps()

http_archive(
    name = "com_github_buildbuddy_io_rules_xcodeproj",
    sha256 = "d943b9a942a1c6b6fc606222933ac9bb6dbbf40a57f1198e552488449580a0f9",
    strip_prefix = "rules_xcodeproj-feda40ca6d42dca7b7278850d22c6807968d80e8",
    url = "https://github.com/buildbuddy-io/rules_xcodeproj/archive/feda40ca6d42dca7b7278850d22c6807968d80e8.tar.gz",
)

load("@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:repositories.bzl", "xcodeproj_rules_dependencies")

xcodeproj_rules_dependencies()
