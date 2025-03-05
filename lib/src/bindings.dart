import 'package:telephony/telephony.dart';

final class MaterialThingsBindings {
  MaterialThingsBindings._();

  static MaterialThingsBindings? _instance;
  static MaterialThingsBindings get instance => _instance ??= MaterialThingsBindings._();

  bool _initialized = false;

  bool get isInitialized => _initialized;

  late TelephonyData _telephonyData;
  TelephonyData get telephonyData {
    assert(_initialized, 'You need to initialize MaterialThingsBindings to use it');
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
    isSupported = await TelephonyManager.isSupported;
    if (isSupported) {
      networkCountryIso = (await TelephonyManager.getNetworkCountryIso()).toLowerCase();
      simCountryIso = (await TelephonyManager.getSimCountryIso()).toLowerCase();
    } else {
      networkCountryIso = '';
      simCountryIso = '';
    }
  }
  
  bool isSupported = false;

  /// In a lower case.
  String simCountryIso = '';

  /// In a lower case.
  String networkCountryIso = '';
}