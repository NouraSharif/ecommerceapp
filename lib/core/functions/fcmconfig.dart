import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/route_manager.dart';

requestPremissionNotification() async {
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((remoteMessage) {
    print("==============Notification=============");
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(
      remoteMessage.notification!.title!,
      remoteMessage.notification!.body!,
    );
  });
}
