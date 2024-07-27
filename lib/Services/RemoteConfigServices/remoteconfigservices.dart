import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService({required FirebaseRemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  Future<void> initialize() async {
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 10),
      ));
      await _remoteConfig.setDefaults({
        'mask_email': true, // Default value
      });
      await _fetchAndActivate();
    } catch (e) {
    }
  }

  Future<void> _fetchAndActivate() async {
    try {
      await _remoteConfig.fetchAndActivate();
      final fetchedValue = _remoteConfig.getBool('mask_email');
    } catch (e) {

    }
  }

  bool get showFullEmail {
    final value = _remoteConfig.getBool('mask_email');
    return value;
  }
}
