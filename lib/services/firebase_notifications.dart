import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifications {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission();
  }

  Future<String> getToken() async {
    return await _firebaseMessaging.getToken() ?? '';
  }

  Future<AuthorizationStatus> getPermissionStatus() async {
    return await _firebaseMessaging
        .getNotificationSettings()
        .then((value) => value.authorizationStatus);
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  void onMessage(void Function(RemoteMessage message) onMessageHandler) {
    FirebaseMessaging.onMessage.listen(onMessageHandler);
  }
}
