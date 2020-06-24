import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sundayservice/widgets/videoPlayer.dart';

class PlayPauseOverlay extends StatelessWidget {
  const PlayPauseOverlay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => CustomVideoPlayer(),
            ),
          ),
          child: Container(
            child: Center(
              child: Icon(
                Icons.play_arrow,
                size: 85,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
//                      color: Colors.blueAccent,
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.35),
            ),
          ),
        ),
      ],
    );
  }
}
