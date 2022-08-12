import SourceKittenFramework
import SwiftSyntax

public struct ForbiddenVarRule: ConfigurationProviderRule, SourceKitFreeRule {
    public var configuration = SeverityConfiguration(.warning)

    public init() {}

    public static let description = RuleDescription(
        identifier: "forbidden_var",
        name: "Forbidden Var",
        description: "Can't name a variable 'forbidden'",
        kind: .style,
        nonTriggeringExamples: [Example("let okay = 0"), Example("let not_forbidden = 0")],
        triggeringExamples: [Example("let ↓forbidden = 0")]
    )

    public func validate(file: SwiftLintFile) -> [StyleViolation] {
        ForbiddenVarRuleVisitor()
            .walk(file: file, handler: \.positions)
            .map { position in
                StyleViolation(ruleDescription: Self.description,
                               severity: configuration.severity,
                               location: Location(file: file, byteOffset: ByteCount(position)))
            }
    }
}

private final class ForbiddenVarRuleVisitor: SyntaxVisitor {
    var positions: [AbsolutePosition] = []

    override func visitPost(_ node: IdentifierPatternSyntax) {
        if node.identifier.text == "forbidden" {
            positions.append(node.positionAfterSkippingLeadingTrivia)
        }
    }
}
