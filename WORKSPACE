load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "f003875c248544009c8e8ae03906bbdacb970bc3e5931b40cd76cadeded99632",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/1.1.0/rules_apple.1.1.0.tar.gz",
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
    sha256 = "e17c6625e19acf8f67cf8e40f8d5203c42c004465f3f6900e6d3ffab82ce69d5",
    strip_prefix = "rules_xcodeproj-8f196e183d703e620bc5dd77298547f869b88110",
    url = "https://github.com/buildbuddy-io/rules_xcodeproj/archive/8f196e183d703e620bc5dd77298547f869b88110.tar.gz",
)

load("@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:repositories.bzl", "xcodeproj_rules_dependencies")

xcodeproj_rules_dependencies()
