
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TikTokVideoPlayer extends StatefulWidget {
  String videoUrl;
   TikTokVideoPlayer({ Key? key ,required this.videoUrl}) : super(key: key);

  @override
  State<TikTokVideoPlayer> createState() => _TikTokVideoPlayerState();
}

class _TikTokVideoPlayerState extends State<TikTokVideoPlayer> {
  late VideoPlayerController videoPlayerController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController=VideoPlayerController.network(widget.videoUrl)..initialize().then((value) {
      videoPlayerController.play();
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.black,

      ),
      child: VideoPlayer(videoPlayerController),
    );
  }
}