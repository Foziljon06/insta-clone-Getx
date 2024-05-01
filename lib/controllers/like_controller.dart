

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/post_model.dart';
import '../services/db_service.dart';
import '../services/utils_servise.dart';

class LikesController extends GetxController{

  bool isLoading = false;
  List<Post> items = [];

  void apiLoadLikes() {
      isLoading = true;
      update();
    DBService.loadLikes().then((value) => {
      resLoadPost(value),
    });
  }

  void resLoadPost(List<Post> posts) {
      items = posts;
      isLoading = false;
      update();
  }

  void apiPostUnLike(Post post) async {
      isLoading = true;
      update();

    await DBService.likePost(post, false);
    apiLoadLikes();
  }
  dialogRemovePost(Post post,BuildContext context) async {
    var result = await Utils.dialogCommon(context, "Instagram", "Do you want to detele this post?", false);

    if (result) {
        isLoading = true;
        update();
      DBService.removePost(post).then((value) => {
        apiLoadLikes(),
      });
    }
  }
}