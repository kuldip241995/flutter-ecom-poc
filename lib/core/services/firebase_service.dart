import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  FirebaseService._internal();
  factory FirebaseService() {
    return _instance;
  }
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  static FirebasePerformance performance = FirebasePerformance.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  Future<void> initialize() async {
    await analytics.setAnalyticsCollectionEnabled(true);
    try {
      await _remoteConfig.fetchAndActivate();
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(minutes: 5),
        ),
      );
      _remoteConfig.onConfigUpdated.listen((event) async {
        await _remoteConfig.activate();
        print("events => ${event.updatedKeys}");
        // Use the new config values here.
      });
    } catch (e) {
      print("Error initializing remote config: $e");
    }
  }

  Future<void> sendCustomLogEvents(
      String eventName, Map<String, dynamic> screenParams) async {
    if (Firebase.apps.isNotEmpty) {
      // Firebase has been initialized
      print("eventName => $eventName");
      print("screenParams => $screenParams");

      // Access the screenName from screenParams
      String screenNameValue = screenParams['screenName'];
      await analytics.setCurrentScreen(screenName: screenNameValue);

      // Adding static userId
      await analytics.setUserId(id: '123456');

      // Adding New Custom Events Using parameters
      await analytics.logEvent(
        name: eventName,
        parameters: screenParams,
      );
    } else {
      print("Firebase is not initialized yet");
    }
  }

  String getRemoteConfigStringValue(String key) {
    return _remoteConfig.getString(key);
  }

  bool getRemoteConfigBoolValue(String key) {
    return _remoteConfig.getBool(key);
  }
}
