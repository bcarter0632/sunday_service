import 'package:audioplayers/audioplayers.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:sundayservice/widgets/overlay.dart';
import 'package:video_player/video_player.dart';

class CustomAudioPlayer extends StatefulWidget {
  @override
  _CustomAudioPlayerState createState() => _CustomAudioPlayerState();
}

class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
  bool _isPlaying = false;
  AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  playAudioFromLocalStorage(path) async {
    int response = await audioPlayer.play(path);

    if (response == 1) {
      // success

    } else {
      print('Some error occured in playing from storage!');
    }
  }

  pauseAudio() async {
    int response = await audioPlayer.pause();

    if (response == 1) {
      // success

    } else {
      print('Some error occured in pausing');
    }
  }

  stopAudio() async {
    int response = await audioPlayer.stop();

    if (response == 1) {
      // success

    } else {
      print('Some error occured in stopping');
    }
  }

  resumeAudio() async {
    int response = await audioPlayer.resume();

    if (response == 1) {
      // success

    } else {
      print('Some error occured in resuming');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Colors.black,
      appBar: PlatformAppBar(
        backgroundColor: Colors.black,
        ios: (_) => CupertinoNavigationBarData(
          heroTag: "audioPlayerPage",
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          if (_isPlaying == true) {
                            pauseAudio();

                            setState(() {
                              _isPlaying = false;
                            });
                          } else {
                            resumeAudio();

                            setState(() {
                              _isPlaying = true;
                            });
                          }
                        },
                        child:
                            Icon(_isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white,),
                        color: Colors.black,
                      ),
                      RaisedButton(
                        onPressed: () {
                          stopAudio();

                          setState(() {
                            _isPlaying = false;
                          });
                        },
                        child: Icon(Icons.stop, color: Colors.white,),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () async {
                    var path =

//                    await FilePicker.getFilePath(type: FileType.audio);

                        setState(() {
                      _isPlaying = true;
                    });

                    playAudioFromLocalStorage(
                        "https://firebasestorage.googleapis.com/v0/b/sundayservicev1.appspot.com/o/file_example_MP3_1MG.mp3?alt=media&token=837c53e4-b63e-4819-8fdf-d96153189562");
                  },
                  child: Text(
                    'Load Audio File',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
