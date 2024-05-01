import 'package:get/get.dart';
import 'package:instagram/controllers/home_controller.dart';
import 'package:instagram/controllers/search_controller.dart';
import 'package:instagram/controllers/signIn_controller.dart';
import 'package:instagram/controllers/signUp_controller.dart';
import 'package:instagram/controllers/splash_controller.dart';
import 'package:instagram/controllers/upload_controller.dart';

import '../controllers/feed_controller.dart';
import '../controllers/like_controller.dart';
import '../controllers/profile_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => FeedController(), fenix: true);
    Get.lazyPut(() => LikesController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => MySearchController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => UploadController(), fenix: true);
  }
}