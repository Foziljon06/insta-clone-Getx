
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/post_model.dart';
import '../services/db_service.dart';
import '../services/utils_servise.dart';

class FeedController extends GetxController{
  bool isLoading = false;
  List<Post> items = [];

  void apiPostLike(Post post) async {
      isLoading = true;
      update();

    await DBService.likePost(post, true);
      isLoading = false;
      update();
      post.liked = true;
  }

  void apiPostUnLike(Post post) async {
      isLoading = true;
      update();

    await DBService.likePost(post, false);
      isLoading = false;
      update();
      post.liked = false;
  }


  apiLoadFeeds() {
      isLoading = true;
      update();
    DBService.loadFeeds().then((value) => {
      resLoadFeeds(value),
    });
  }

  resLoadFeeds(List<Post> posts) {
      items = posts;
      isLoading = false;
      update();
  }



  dialogRemovePost(Post post,BuildContext context) async {
    var result = await Utils.dialogCommon(context,"Instagram", "Do you want to detele this post?", false);
        isLoading = true;
        update();
      DBService.removePost(post).then((value) => {
        apiLoadFeeds(),
      });
    }
  }
