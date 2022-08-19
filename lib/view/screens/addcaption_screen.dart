import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titok_clone/constant.dart';
import 'package:titok_clone/controller/upload_video_controller.dart';
import 'package:titok_clone/view/widgets/text_input.dart';
import 'package:video_player/video_player.dart';

class AddCaptionScreen extends StatefulWidget {
  File videoFile;
  String videoPath;
  AddCaptionScreen({Key? key, required this.videoFile, required this.videoPath})
      : super(key: key);

  @override
  State<AddCaptionScreen> createState() => _AddCaptionScreenState();
}

class _AddCaptionScreenState extends State<AddCaptionScreen> {
  late VideoPlayerController videoPlayerController;
  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());
  TextEditingController captionController = TextEditingController();
  TextEditingController songNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    videoPlayerController = VideoPlayerController.file(widget.videoFile);
    videoPlayerController.initialize().then((value) {
      videoPlayerController.play();

      setState(() {});
      videoPlayerController.setLooping(true);
      videoPlayerController.setVolume(0.7);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
    captionController.dispose();
    songNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: VideoPlayer(videoPlayerController),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextInputField(
                      controller: songNameController,
                      myIcon: Icons.music_note,
                      myLabelText: "Song Name"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextInputField(
                      controller: captionController,
                      myIcon: Icons.closed_caption,
                      myLabelText: "Caption"),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      uploadVideoController.uploadVideo(songNameController.text,
                          captionController.text, widget.videoPath);
                    },
                    child: const Text("Upload"),
                    style: ElevatedButton.styleFrom(primary: buttomColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
