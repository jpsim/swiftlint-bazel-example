import SwiftSyntax

@SwiftSyntaxRule
struct ForbiddenVarRule: Rule {
    var configuration = SeverityConfiguration<Self>(.error)

    static let description = RuleDescription(
        identifier: "forbidden_var",
        name: "Forbidden Var",
        description: "Variables should not be called 'forbidden'",
        kind: .idiomatic,
        nonTriggeringExamples: [
            Example("let notForbidden = 0")
        ],
        triggeringExamples: [
            Example("let ↓forbidden = 0")
        ]
    )
}

private extension ForbiddenVarRule {
    final class Visitor: ViolationsSyntaxVisitor<ConfigurationType> {
        override func visitPost(_ node: IdentifierPatternSyntax) {
            if node.identifier.text == "forbidden" {
                violations.append(node.identifier.positionAfterSkippingLeadingTrivia)
            }
        }
    }
}
