import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instagram/controllers/upload_controller.dart';
class MyUploadPage extends StatefulWidget {
  final PageController? pageController;

  const MyUploadPage({Key? key, this.pageController}) : super(key: key);

  @override
  State<MyUploadPage> createState() => _MyUploadPageState();
}

class _MyUploadPageState extends State<MyUploadPage> {
  final _controller = Get.find<UploadController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Upload",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _controller.uploadNewPost(widget.pageController!);
              },
              icon: const Icon(
                Icons.drive_folder_upload,
                color: Color.fromRGBO(193, 53, 132, 1),
              ),
            ),
          ],
        ),
        body: GetBuilder<UploadController>(
          builder: (_) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _controller.showPicker(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.width,
                            color: Colors.grey.withOpacity(0.4),
                            child: _controller.imageFile == null
                                ? const Center(
                                    child: Icon(
                                      Icons.add_a_photo,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  )
                                : Stack(
                                    children: [
                                      Image.file(
                                        _controller.imageFile!,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        color: Colors.black12,
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _controller.imageFile = null;
                                                });
                                              },
                                              icon: const Icon(
                                                  Icons.highlight_remove),
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: TextField(
                            controller: _controller.captionController,
                            style: const TextStyle(color: Colors.black),
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 5,
                            decoration: const InputDecoration(
                                hintText: "Caption",
                                hintStyle: TextStyle(
                                    fontSize: 17, color: Colors.black38)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _controller.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ));
  }
}
