import SwiftUI

struct ContentView: View {
    @State private var brandDecision: DSBrandDecision = .ocean
    @State private var email = ""
    @State private var password = ""
    @State private var isSaving = false

    private var canSave: Bool {
        !email.isEmpty && password.count >= 8 && !isSaving
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Picker("Brand", selection: $brandDecision) {
                        ForEach(DSBrandDecision.allCases) { brand in
                            Text(brand.rawValue).tag(brand)
                        }
                    }
                    .pickerStyle(.segmented)

                    DSSectionHeader(
                        title: "Design System Showcase",
                        subtitle: "Tokens + reusable components running in one themed subtree",
                        actionTitle: "Reset",
                        action: {
                            email = ""
                            password = ""
                            isSaving = false
                        }
                    )

                    DSCard(
                        title: "Account Setup",
                        subtitle: "Reusable fields and action roles",
                        footer: "This screen uses the imported token pipeline and component contracts."
                    ) {
                        VStack(alignment: .leading, spacing: 12) {
                            DSField(
                                title: "Email",
                                placeholder: "name@domain.com",
                                text: $email,
                                helperText: "Used for sign-in and product updates.",
                                keyboardType: .emailAddress,
                                textContentType: .emailAddress,
                                submitLabel: .next
                            )

                            DSField(
                                title: "Password",
                                placeholder: "Minimum 8 characters",
                                text: $password,
                                state: password.isEmpty || password.count >= 8 ? .normal : .error,
                                errorText: "Password must contain at least 8 characters.",
                                isSecure: true,
                                textContentType: .newPassword,
                                submitLabel: .done
                            )

                            HStack(spacing: 8) {
                                DSStatusBadge(kind: .info, text: brandDecision.rawValue)
                                DSStatusBadge(kind: canSave ? .success : .warning, text: canSave ? "Ready" : "Incomplete")
                            }

                            DSButton(
                                isSaving ? "Saving..." : "Save",
                                role: .primary,
                                size: .regular,
                                state: isSaving ? .loading : (canSave ? .enabled : .disabled),
                                action: {
                                    isSaving = true
                                    Task {
                                        try? await Task.sleep(for: .seconds(1))
                                        isSaving = false
                                    }
                                }
                            )

                            DSButton(
                                "Delete draft",
                                role: .destructive,
                                size: .compact,
                                state: .enabled,
                                action: {}
                            )
                        }
                    }

                    DSFeedbackBanner(
                        kind: canSave ? .success : .warning,
                        title: canSave ? "Form is valid" : "Action blocked",
                        message: canSave
                            ? "All required inputs satisfy current validation rules."
                            : "Provide email and password (8+ chars) to enable primary action.",
                        actionTitle: "Review",
                        action: {}
                    )

                    DSCard(title: "Catalog", subtitle: "Composed row primitives") {
                        VStack(alignment: .leading, spacing: 8) {
                            DSListRow(symbolName: "circle.grid.3x3.fill", title: "Tokens", subtitle: "Primitive, semantic, component", trailingText: "3")
                            DSListRow(symbolName: "rectangle.3.group.fill", title: "Families", subtitle: "Button, Field, Card, Banner", trailingText: "4", showsChevron: true)
                            DSListRow(symbolName: "accessibility", title: "Accessibility", subtitle: "Dynamic Type, contrast, RTL aware", trailingText: "Active")
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("DesignSystem")
        }
        .dsTheme(brandDecision)
    }
}

#Preview {
    ContentView()
}
