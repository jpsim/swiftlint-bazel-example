# SwiftLint Bazel Example

This is an example repo that integrates [SwiftLint][SwiftLint] with
[Bazel][Bazel].

## Pre-Requisites

* Install Bazel or Bazelisk (recommended): https://github.com/bazelbuild/bazelisk#installation
* Install Xcode 13.3 or later: https://developer.apple.com/xcode/
* You must be running macOS 12 or later

## Basic Integration

_Please see [SwiftLint's bazel instructions][swiftlint-bazel-instructions]
if these instructions become out of date._

Make sure that you're using bzlmod by adding this line to your
`.bazelrc`:

```
common --enable_bzlmod
```

Then put this in your `MODULE.bazel`:

```python
bazel_dep(name = "swiftlint", version = "0.51.0", repo_name = "SwiftLint")
```

Then you can run SwiftLint with this command:

```console
bazel run -c opt @SwiftLint//:swiftlint -- --help
```

## Custom Rules

### Setup

You can wire up SwiftLint to use some custom, private, native SwiftLint
rules by adding this to your `MODULE.bazel`:

```python
extra_rules = use_extension("@SwiftLint//bazel:extensions.bzl", "extra_rules")
extra_rules.setup(srcs = "@swiftlint-bazel-example//swiftlint_extra_rules:extra_rules")
```

Finally, you'll need to tell Bazel what source files you want to compile
as part of SwiftLint in `swiftlint_extra_rules/BUILD`. For example:

```python
filegroup(
    name = "extra_rules",
    srcs = glob(["**/*.swift"]) + ["extra_rules.swift"],
    visibility = ["//visibility:public"],
)

genrule(
    name = "extra_rules_func",
    srcs = glob(["*.swift"]),
    outs = ["extra_rules.swift"],
    cmd = """
set -euo pipefail

echo "func extraRules() -> [Rule.Type] {" >> $(OUTS)
echo "  [" >> $(OUTS)
for file in $(SRCS); do
  filename=$$(basename -- "$$file")
  echo "    $${filename%.*}.self," >> $(OUTS)
done
echo "  ]" >> $(OUTS)
echo "}" >> $(OUTS)
    """,
)
```

### Writing Rules

Then any Swift sources you add in the `swiftlint_extra_rules` directory
will be compiled as part of the `SwiftLintFramework` module just as if
those files had been in the official upstream SwiftLint git repository.

This means you have access to all the internal APIs in that module.
These internal APIs can and will change over time, so you may need to
adjust the custom code you write accordingly whenever you update the
version of SwiftLint you target.

Then build and run SwiftLint and you should see your rule being applied:

```console
$ bazel run -c opt @SwiftLint//:swiftlint
Linting Swift files in current working directory
Linting 'ForbiddenVarRule.swift' (2/3)
Linting 'file.swift' (1/3)
Linting 'ExtraRules.swift' (3/3)
file.swift:1:14: warning: Colon Spacing Violation: Colons should be next to the identifier when specifying a type and next to the key in dictionary literals. (colon)
file.swift:1:5: warning: Forbidden Var Violation: Can't name a variable 'forbidden' (forbidden_var)
Done linting! Found 2 violations, 0 serious in 3 files.
```

### Testing Rules

You can validate the triggering, non-triggering and correction examples
in your rule's description by running SwiftLint's "extra rules" tests:

```console
bazel test --test_output=streamed @SwiftLint//Tests:ExtraRulesTests
```

## Developing in Xcode

You can use the excellent [rules_xcodeproj][rules_xcodeproj] project to
generate an Xcode project giving you Xcode's IDE functionality to help
you develop your rules.

You can add it to the bottom of your `MODULE.bazel` file:

```python
bazel_dep(name = "rules_xcodeproj", version = "1.4.0")
```

And define a `BUILD` file with this configuration:

```python
load("@rules_xcodeproj//xcodeproj:defs.bzl", "xcodeproj")

xcodeproj(
    name = "swiftlint_xcodeproj",
    project_name = "SwiftLint",
    top_level_targets = [
        "@SwiftLint//:swiftlint",
        "@SwiftLint//Tests:ExtraRulesTests",
    ],
)
```

Generate and open the Xcode project with this command:

```console
bazel run :swiftlint_xcodeproj && xed .
```

At which point you should have access to most Xcode features you'd want
when developing.

![Xcode](xcode.png)

[SwiftLint]: https://github.com/realm/SwiftLint
[Bazel]: https://bazel.build
[swiftlint-bazel-instructions]: https://github.com/realm/SwiftLint#using-bazel
[rules_xcodeproj]: https://github.com/buildbuddy-io/rules_xcodeproj
