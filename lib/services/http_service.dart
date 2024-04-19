import 'dart:convert';
import 'package:http/http.dart';

import '../models/member_model.dart';
import '../models/notification_model.dart';

class Network {  static String SERVER_FCM = "fcm.googleapis.com";

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization':
    'key=AAAA9TPIEos:APA91bGO15A3WZinloJmt65GOHzwCu7-oPM_lmRA6P46_40P8wMW0zRWzzxOFEu0THVjk6wPWSce3o_L-yQ22PlSYnYsesVuPHtJgRgYkTukE7VQOBKAzf3H8E-sxJbBpHDaBSA6loHo'
  };

  /* Http Requests */

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(SERVER_FCM, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  /* Http Apis*/
  static String API_SEND_NOTIF = "/fcm/send";

  /* Http Params */
  static Map<String, dynamic> paramsNotify(Member sender, Member receiver) {
    var notification = Notification(title: "Followed", body: "${sender.fullname} has just been followed");
    var registrationIds = [receiver.device_token];
    var notificationModel = NotificationModel(notification: notification, registrationIds: registrationIds);
    return notificationModel.toJson();
  }
}