import 'package:flutter/foundation.dart';
import 'package:user_country_detector_android/user_country_detector_android.dart';

final class MaterialThingsBindings {
  MaterialThingsBindings._();

  static MaterialThingsBindings? _instance;
  static MaterialThingsBindings get instance =>
      _instance ??= MaterialThingsBindings._();

  bool _initialized = false;

  bool get isInitialized => _initialized;

  late TelephonyData _telephonyData;
  TelephonyData get telephonyData {
    assert(
      _initialized,
      'You need to initialize MaterialThingsBindings to use it',
    );
    return _telephonyData;
  }

  Future<void> ensureInitialized() async {
    if (_initialized) {
      return;
    }
    _initialized = true;
    await _init();
  }

  Future<void> _init() async {
    _telephonyData = TelephonyData._();
    await telephonyData._update();
  }
}

final class TelephonyData {
  TelephonyData._();

  Future<void> _update() async {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        _isSupported = await UserCountryDetectorAndroid.isSupported;
        if (isSupported) {
          _countryIso =
              await UserCountryDetectorAndroid.getCountryIso3166Alpha2();
        }
      default:
        _isSupported = false;
    }
  }

  bool _isSupported = false;
  String _countryIso = '';

  bool get isSupported => _isSupported;
  String get countryIso => _countryIso;
}
