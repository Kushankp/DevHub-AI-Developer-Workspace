# Phase 1 - Foundation

Phase 1 establishes the boundaries that later features build on. The goal is not to ship GitHub behavior yet; it is to make app startup, configuration, logging, navigation, dependency injection, and review tooling explicit.

## Decisions

- The app uses a small dependency container instead of global singletons. This keeps tests able to replace services without changing feature code.
- Navigation is owned by `AppCoordinator`, with `AppRoute` as the typed route surface. Feature routes are added only when the feature has a real destination.
- Runtime configuration is loaded from Info.plist values backed by xcconfig files. Secrets remain outside source control and can be supplied by local or CI configuration.
- Logging is a thin facade over `os.Logger`. That keeps privacy-aware Apple logging without introducing another dependency.
- SwiftLint and SwiftFormat are configured at the repository root so style is reviewable and repeatable in CI.

## Tradeoffs

- The repository does not include a generated `.xcodeproj` yet. A full iOS project file should be introduced deliberately with the CI lane once Xcode is available locally.
- SwiftPM currently validates `DevHubCore`, not the SwiftUI app target. This keeps core contracts buildable in the current environment while avoiding a hand-written project file that cannot be tested here.
- OAuth values are represented in configuration, but authentication is not implemented in this phase. That boundary avoids insecure token handling and keeps Phase 3 focused.

## Validation

- `swift build` validates the core package.
- XCTest execution requires a full Xcode toolchain selected with `xcode-select`; the current machine is using Command Line Tools.
