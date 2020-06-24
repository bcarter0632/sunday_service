/*
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:sundayservice/models/sermon.dart';
import 'package:sundayservice/widgets/audioPlayer.dart';
import 'package:sundayservice/widgets/basicsermoncard.dart';
import 'package:sundayservice/widgets/overlay.dart';
import 'package:sundayservice/widgets/sermoncard.dart';
import 'package:sundayservice/widgets/videoPlayer.dart';
import 'package:video_player/video_player.dart';

class SermonDetailsPage extends StatelessWidget {
  final Sermon sermon;

  SermonDetailsPage({Key key, @required this.sermon}) : super(key: key);

//  @override
//  _SermonDetailsPageState createState() => _SermonDetailsPageState();
//}

//class _SermonDetailsPageState extends State<SermonDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        ios: (_) => CupertinoNavigationBarData(
          title: PlatformText(sermon.sermonName),
          heroTag: 'sermonDetailsPage',
          transitionBetweenRoutes: false,
          leading: PlatformButton(
            padding: EdgeInsets.all(1.0),
            child: Icon(CupertinoIcons.back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            padding: const EdgeInsets.all(5),
            children: <Widget>[
              Stack(
                alignment: FractionalOffset.topCenter +
                    const FractionalOffset(0.01, 0.20),
                children: <Widget>[
                  BasicSermonCard(sermon),
                  PlayPauseOverlay(),
//                  PlatformIconButton(
//                    padding: EdgeInsets.all(1.0),
//                    icon: Icon(
//                      CupertinoIcons.play_arrow_solid,
//                      size: 75,
//                      color: Colors.white,
//                    ),
//                    onPressed: () => Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        fullscreenDialog: true,
//                        builder: (context) => CustomVideoPlayer(),
//                      ),
//                    ),
//                  ),
                ],
              ),
              Divider(
                color: Colors.black.withOpacity(0.10),
                thickness: 1.0,
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: PlatformButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => CustomAudioPlayer(),
                            ),
                          ),
                          padding: EdgeInsets.all(2.0),
                          child: PlatformText("Listen to Audio"),
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black.withOpacity(0.10),
                thickness: 1.0,
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Center(child: Text(sermon.sermonDescription)),
              ),
            ],
          ), //Text(sermon.sermonName)
        ),
      ),
    );
  }
}
