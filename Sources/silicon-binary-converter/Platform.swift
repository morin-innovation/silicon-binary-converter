import Foundation
import MachO

enum Platform: String, Decodable {
    case iOS = "ios"
    case macOS = "macos"
    case macCatalyst = "maccatalyst"
    case tvOS = "tvos"
    case visionOS = "visionos"
    case watchOS = "watchos"
    case iOSSimulator = "ios-simulator"
    case tvOSSimulator = "tvos-simulator"
    case visionOSSimulator = "visionos-simulator"
    case watchOSSimulator = "watchos-simulator"

    var machOValue: Int32 {
        switch self {
            case .iOS:
                PLATFORM_IOS
            case .macOS:
                PLATFORM_MACOS
            case .tvOS:
                PLATFORM_TVOS
            case .visionOS:
                PLATFORM_VISIONOS
            case .watchOS:
                PLATFORM_WATCHOS
            case .iOSSimulator:
                PLATFORM_IOSSIMULATOR
            case .tvOSSimulator:
                PLATFORM_TVOSSIMULATOR
            case .visionOSSimulator:
                PLATFORM_VISIONOSSIMULATOR
            case .watchOSSimulator:
                PLATFORM_WATCHOSSIMULATOR
            case .macCatalyst:
                PLATFORM_MACCATALYST
        }
    }
}
