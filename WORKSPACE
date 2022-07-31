load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "36072d4f3614d309d6a703da0dfe48684ec4c65a89611aeb9590b45af7a3e592",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/1.0.1/rules_apple.1.0.1.tar.gz",
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
    sha256 = "7dcb520cd80724584126aeb89bc7db55cb35267aa668613f28084202a2d03ede",
    strip_prefix = "SwiftLint-1dab8181b8597c493463dbab48aa7380dcd99123",
    url = "https://github.com/realm/SwiftLint/archive/1dab8181b8597c493463dbab48aa7380dcd99123.tar.gz",
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
    sha256 = "bea7b222da69b8d631f1f19ef6155028498ca0807584ecf1ac30d756fd872f60",
    strip_prefix = "rules_xcodeproj-1cc0245336bf17d0a8483da21048faeb14ac53a9",
    url = "https://github.com/buildbuddy-io/rules_xcodeproj/archive/1cc0245336bf17d0a8483da21048faeb14ac53a9.tar.gz",
)

load("@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:repositories.bzl", "xcodeproj_rules_dependencies")

xcodeproj_rules_dependencies()
