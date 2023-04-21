import SwiftSyntax

struct ForbiddenVarRule: ConfigurationProviderRule, SwiftSyntaxRule {
    var configuration = SeverityConfiguration(.error)

    init() {}

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

    func makeVisitor(file: SwiftLintFile) -> ViolationsSyntaxVisitor {
        Visitor(viewMode: .sourceAccurate)
    }
}

private extension ForbiddenVarRule {
    final class Visitor: ViolationsSyntaxVisitor {
        override func visitPost(_ node: IdentifierPatternSyntax) {
            if node.identifier.text == "forbidden" {
                violations.append(node.identifier.positionAfterSkippingLeadingTrivia)
            }
        }
    }
}
