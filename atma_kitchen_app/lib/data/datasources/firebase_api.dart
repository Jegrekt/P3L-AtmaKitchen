import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  //

  Future<void> initNotifications(int id) async {
    await _firebaseMessaging.requestPermission();
    _firebaseMessaging.subscribeToTopic('notif-$id');
  }

  Future<void> unsubscribeToTopic(int id) async {
    await _firebaseMessaging.unsubscribeFromTopic('notif-$id');
  }
}
