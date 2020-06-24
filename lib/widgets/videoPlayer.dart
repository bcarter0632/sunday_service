import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:sundayservice/widgets/overlay.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController _controller;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
//    _controller = VideoPlayerController.network(
//        'https://firebasestorage.googleapis.com/v0/b/sundayservicev1.appspot.com/o/480p.m3u8?alt=media&token=033aa546-e622-4934-b5c2-2f5ff74ad212')
//      ..initialize().then((_) {
//        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//        setState(() {});
//      });
    _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/sundayservicev1.appspot.com/o/480p.m3u8?alt=media&token=033aa546-e622-4934-b5c2-2f5ff74ad212');
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
      // Try playing around with some of these other options:

//       showControls: false,
//       materialProgressColors: ChewieProgressColors(
//         playedColor: Colors.red,
//         handleColor: Colors.blue,
//         backgroundColor: Colors.black,
//         bufferedColor: Colors.lightGreen,
//       ),
       placeholder: Container(
         color: Colors.black,
       ),
      // autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Colors.black,
      appBar: PlatformAppBar(
        backgroundColor: Colors.black,
        ios: (_) => CupertinoNavigationBarData(
          heroTag: "videoPlayerPage",
          transitionBetweenRoutes: false,
          leading: PlatformButton(
            padding: EdgeInsets.all(4.0),
            child: Icon(Icons.keyboard_arrow_down, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Chewie(
                controller: _chewieController,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
