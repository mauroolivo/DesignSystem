# DesignSystem

A production-minded **SwiftUI design system reference app** from UI Matters.

This project demonstrates how to build a small but meaningful design system in SwiftUI with an emphasis on:

- token layering and theme resolution
- reusable, typed component APIs
- native SwiftUI behavior with custom styling on top
- accessibility-aware adaptation for Dynamic Type and contrast
- clear ownership boundaries between platform, semantic, and component decisions

The app includes a live demo screen where you can switch themes and see shared tokens and components update together.

## What’s included

- `DSTokens.swift` — primitive, semantic, and component token layers
- `DSButtonFamily.swift` — typed button roles, sizes, and states
- `DSFieldFamily.swift` — reusable text field and secure field contracts
- `DSComposedComponents.swift` — composed UI primitives like cards, banners, badges, and rows
- `ContentView.swift` — interactive showcase of the system in action

## Why this project exists

The goal is not to maximize component count. It is to show how a design system can improve clarity, consistency, and long-term maintainability when it is built around explicit decisions and evidence.

## Article

Read the companion article here:

https://uimatters.io/articles/swiftui-design-system-decisions

## Open in Xcode

1. Open `DesignSystem.xcodeproj`
2. Select the `DesignSystem` scheme
3. Run the app on iPhone, iPad, or the simulator

## Notes

- The project is intentionally narrow in scope.
- It focuses on representative patterns rather than a huge component catalog.
- The architecture is designed to make trade-offs visible and easy to reason about.
