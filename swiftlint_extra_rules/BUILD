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

echo "public func extraRules() -> [any Rule.Type] {" >> $(OUTS)
echo "  [" >> $(OUTS)
for file in $(SRCS); do
  filename=$$(basename -- "$$file")
  echo "    $${filename%.*}.self," >> $(OUTS)
done
echo "  ]" >> $(OUTS)
echo "}" >> $(OUTS)
    """,
)
