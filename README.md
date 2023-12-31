# libxmr

[libxmr](https://git.cypherstack.com/julian/libxmr) as a multi-platform Flutter FFI plugin for Monero using [monero-serai, serai-dex/serai's Monero library](https://github.com/serai-dex/serai).

## Getting started

### Install Rust 

https://www.rust-lang.org/tools/install

### Install cargo ndk
```sh
cargo install cargo-ndk
```

### Install Flutter

https://docs.flutter.dev/get-started/install

### Install dependencies
```sh
sudo apt install git build-essential cmake llvm clang pkg-config cargo rustc libssl-dev libc6-dev-i386 libclang-dev
```

Windows and MacOS, see additional [ffigen](https://pub.dev/packages/ffigen#installing-llvm) requirements

### Init `serai` submodule
```sh
git submodule update --init --recursive
```

### Run build scripts

#### Linux

Run build script
```sh
cd scripts/linux
./build_all.sh
```
<!--
#### Android

Run the NDK setup and build scripts
```sh
cd scripts/android
./install_ndk.sh
./build_all.sh
```
-->
## Development

 - Use `flutter run` in the `example` folder for a demonstration of this plugin.
 - To generate `libxmr_bindings.h` C bindings for Rust: `cbindgen --config cbindgen.toml --crate libxmr --output libxmr_bindings.h` <!--C bindings are generated on `cargo build`s via `build.rs`. TODO re-enable this after build.rs is fixed to produce the same output as the cbindgen command above-->
 - To generate `libxmr_bindings_generated.dart` Dart bindings for C: `dart run ffigen --config ffigen.yaml`
 - If bindings are generated for a new (not previously supported/included in `lib/libxmr.dart`) function, a wrapper function for it must be written by hand (see: `generateMnemonic`, `generateAddress`)

## Getting Started

This project is a starting point for a Flutter
[FFI plugin](https://docs.flutter.dev/development/platform-integration/c-interop),
a specialized package that includes native code directly invoked with Dart FFI.

## Project structure

This template uses the following structure:

* `src`: Contains the native source code, and a CmakeFile.txt file for building
  that source code into a dynamic library.

* `lib`: Contains the Dart code that defines the API of the plugin, and which
  calls into the native code using `dart:ffi`.

* platform folders (`android`, `ios`, `windows`, etc.): Contains the build files
  for building and bundling the native code library with the platform application.

## Building and bundling native code

The `pubspec.yaml` specifies FFI plugins as follows:

```yaml
  plugin:
    platforms:
      some_platform:
        ffiPlugin: true
```

This configuration invokes the native build for the various target platforms
and bundles the binaries in Flutter applications using these FFI plugins.

This can be combined with dartPluginClass, such as when FFI is used for the
implementation of one platform in a federated plugin:

```yaml
  plugin:
    implements: some_other_plugin
    platforms:
      some_platform:
        dartPluginClass: SomeClass
        ffiPlugin: true
```

A plugin can have both FFI and method channels:

```yaml
  plugin:
    platforms:
      some_platform:
        pluginClass: SomeName
        ffiPlugin: true
```

The native build systems that are invoked by FFI (and method channel) plugins are:

* For Android: Gradle, which invokes the Android NDK for native builds.
  * See the documentation in android/build.gradle.
* For iOS and MacOS: Xcode, via CocoaPods.
  * See the documentation in ios/libxmr.podspec.
  * See the documentation in macos/libxmr.podspec.
* For Linux and Windows: CMake.
  * See the documentation in linux/CMakeLists.txt.
  * See the documentation in windows/CMakeLists.txt.

## Binding to native code

To use the native code, bindings in Dart are needed.
To avoid writing these by hand, they are generated from the header file
(`src/libxmr.h`) by `package:ffigen`.
Regenerate the bindings by running `flutter pub run ffigen --config ffigen.yaml`.

## Invoking native code

Very short-running native functions can be directly invoked from any isolate.
For example, see `sum` in `lib/libxmr.dart`.

Longer-running functions should be invoked on a helper isolate to avoid
dropping frames in Flutter applications.
For example, see `sumAsync` in `lib/libxmr.dart`.

## Flutter help

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

