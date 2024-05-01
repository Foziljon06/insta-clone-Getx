
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:instagram/pages/home_page.dart';
import 'package:instagram/pages/signin_page.dart';

import '../services/auth_service.dart';
import '../services/log_service.dart';
import '../services/notif_service.dart';
import '../services/prefs_service.dart';

class SplashController extends GetxController{
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  callNextPage(){
    if(AuthService.isLoggedIn()){
      // Navigator.pushReplacementNamed(context, HomePage.id);
      Get.offNamed(HomePage.id);
    }else{
      // Navigator.pushReplacementNamed(context, SignInPage.id);
      Get.offNamed(SignInPage.id);
    }
  }

  initTimer() {
    Timer(const Duration(seconds: 2), () {
      callNextPage();
    });
  }

  initNotification() async{
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      LogService.i('User granted permission');
    }else{
      LogService.e('User declined or has not accepted permission');
    }

    _firebaseMessaging.getToken().then((value) async{
      String fcmToken = value.toString();
      Prefs.saveFCM(fcmToken);
      String token = await Prefs.loadFCM();
      LogService.i("FCM Token: $token");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      String title = message.notification!.title.toString();
      String body = message.notification!.body.toString();
      LogService.i(title);
      LogService.i(body);
      LogService.i(message.data.toString());
      NotifService().showLocalNotification(title,body);
    });
  }
}