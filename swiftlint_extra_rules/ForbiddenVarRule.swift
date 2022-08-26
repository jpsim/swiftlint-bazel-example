import SourceKittenFramework
import SwiftSyntax

public struct ForbiddenVarRule: ConfigurationProviderRule, SwiftSyntaxRule {
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

    public func makeVisitor(file: SwiftLintFile) -> ViolationsSyntaxVisitor? {
        ForbiddenVarRuleVisitor()
    }
}

private final class ForbiddenVarRuleVisitor: SyntaxVisitor, ViolationsSyntaxVisitor {
    private(set) var violationPositions: [AbsolutePosition] = []

    override func visitPost(_ node: IdentifierPatternSyntax) {
        if node.identifier.text == "forbidden" {
            violationPositions.append(node.positionAfterSkippingLeadingTrivia)
        }
    }
}
