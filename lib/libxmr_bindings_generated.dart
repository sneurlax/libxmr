// ignore_for_file: always_specify_types
// ignore_for_file: camel_case_types
// ignore_for_file: non_constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint
import 'dart:ffi' as ffi;

/// Bindings for `libxmr_bindings.h`.
///
/// Regenerate bindings with `flutter pub run ffigen --config ffigen.yaml`.
///
class LibxmrBindings {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  LibxmrBindings(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  LibxmrBindings.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  ffi.Pointer<ffi.Char> generate_address(
    ffi.Pointer<ffi.Char> mnemonic,
    int account,
    int index,
  ) {
    return _generate_address(
      mnemonic,
      account,
      index,
    );
  }

  late final _generate_addressPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Char>, ffi.Uint32,
              ffi.Uint32)>>('generate_address');
  late final _generate_address = _generate_addressPtr.asFunction<
      ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Char>, int, int)>();

  ffi.Pointer<ffi.Char> generate_seed() {
    return _generate_seed();
  }

  late final _generate_seedPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<ffi.Char> Function()>>(
          'generate_seed');
  late final _generate_seed =
      _generate_seedPtr.asFunction<ffi.Pointer<ffi.Char> Function()>();
}
