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
    sha256 = "ec566314e9220ff681ddb639d3a0532834f66f7e733f5a59c7390469dcb5bd3e",
    url = "https://github.com/realm/SwiftLint/releases/download/0.49.0/bazel.tar.gz",
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
    sha256 = "1dd8e60ccb457536960d37ad77109c941060d8bc1e6c8b318c7a54ac7cec1b68",
    url = "https://github.com/buildbuddy-io/rules_xcodeproj/releases/download/0.7.1/release.tar.gz",
)

load("@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:repositories.bzl", "xcodeproj_rules_dependencies")

xcodeproj_rules_dependencies()
