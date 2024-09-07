import ArgumentParser

@main
struct App: ParsableCommand {
    @Option(name: [.customShort("p"), .customLong("platform")], help: "Target platform (ios, ios-simulator, ...)") private var platform: Platform
    @Option(name: [.customShort("m"), .customLong("min-os-version")], help: "Minimum OS version") private var minOS: UInt32?
    @Option(name: [.customShort("s"), .customLong("sdk-version")], help: "SDK version") private var sdk: UInt32?
    @Option(name: [.customShort("b"), .customLong("binary-type")], help: "Binary type (static|dynamic)") private var binaryType: BinaryType = .static
    @Argument(help: "Path to source binary") private var sourcePath: String
    @Argument(help: "Path to destination binary") private var destinationPath: String


    mutating func run() throws {
        let defaultVersion: UInt32

        switch platform {
            case .iOS, .iOSSimulator:
                defaultVersion = 17
            case .macOS, .macCatalyst:
                defaultVersion = 14
            case .tvOS, .tvOSSimulator:
                defaultVersion = 17
            case .visionOS, .visionOSSimulator:
                defaultVersion = 1
            case .watchOS, .watchOSSimulator:
                defaultVersion = 10
        }

        let minOS = self.minOS ?? defaultVersion
        let sdk = self.sdk ?? defaultVersion
        Transmogrifier.processBinary(from: sourcePath, to: destinationPath, platform: platform, minos: minOS, sdk: sdk, binaryType: binaryType)
    }
}

extension BinaryType: ExpressibleByArgument { }
extension Platform: ExpressibleByArgument { }
