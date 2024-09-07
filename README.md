# silicon-binary-converter

A lightweight command-line tool for adapting native ARM64 binaries to run on multiple Apple Silicon platforms.

This tool is a fork of the [arm64-to-sim](https://github.com/bogo/arm64-to-sim) project, with additional adjustments to extend its capabilities.

## ⚠️ Disclaimer

This tool allows users to modify binaries for compatibility with multiple platforms. **However**, it is your responsibility to ensure you have the legal right to modify and distribute the binaries in question.

Unauthorized modification of software can violate intellectual property laws, software licenses, or terms of service. **Always verify that you are permitted to alter a binary according to the relevant legal agreements**. The creator of this tool is not liable for any misuse or legal consequences arising from its use.

## Building

To build a universal `silicon-binary-converter` executable, run:

```bash
swift build -c release --arch arm64 --arch x86_64
```

The resulting executable will be located in the `.build/apple/Products/Release` directory.

## Usage

To use `silicon-binary-converter`, run the following command:

```bash
./silicon-binary-converter --platform <platform> [--min-os-version <min-os-version>] [--sdk-version <sdk-version>] [--binary-type <binary-type>] <source-path> <destination-path>
```

### Arguments:

- `<source-path>`: Path to the source binary
- `<destination-path>`: Path where the modified binary will be saved

### Options:

- `-p, --platform <platform>`: Target platform (e.g., `ios`, `ios-simulator`, `macos`, etc.)
- `-m, --min-os-version <min-os-version>`: Minimum OS version (optional)
- `-s, --sdk-version <sdk-version>`: SDK version (optional)
- `-b, --binary-type <binary-type>`: Binary type (`static` or `dynamic`; default: `static`)
- `-h, --help`: Display help information

> If not provided, the minimum OS version and SDK version default to the latest available.

### Example

To convert an iOS binary library to a macOS (Apple Silicon) binary version, run:

```bash
./silicon-binary-converter --platform macos libsomething_ios.a libsomething_macos.a
```

### Supported destination platforms

You can target the following platforms:

- `ios`: iOS
- `macos`: macOS
- `maccatalyst`: Mac Catalyst
- `tvos`: tvOS
- `visionos`: visionOS
- `watchos`: watchOS
- `ios-simulator`: iOS Simulator
- `tvos-simulator`: tvOS Simulator
- `visionos-simulator`: visionOS Simulator
- `watchos-simulator`: watchOS Simulator
