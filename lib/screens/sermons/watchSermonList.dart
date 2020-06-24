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

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:sundayservice/models/sermon.dart';
import 'package:sundayservice/screens/sermons/sermonDetails.dart';
import 'package:sundayservice/widgets/sermoncard.dart';

class WatchSermonListPage extends StatefulWidget {
  @override
  _WatchSermonListPageState createState() => _WatchSermonListPageState();
}

class _WatchSermonListPageState extends State<WatchSermonListPage> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText("Sermons"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection("sermons")
                .orderBy("sermonDate", descending: false)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return PlatformCircularProgressIndicator();
              final int messageCount = snapshot.data.documents.length;
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemCount: messageCount,
                itemBuilder: (_, int index) {
                  final DocumentSnapshot document =
                      snapshot.data.documents[index];
                  final dynamic sermonName = document['sermonName'];
                  final dynamic sermonDate = document['sermonDate'];
                  final dynamic sermonDescription =
                      document['sermonDescription'];
                  final dynamic sermonAudioUrl = document['sermonAudioUrl'];
                  final dynamic sermonImageUrl = document['sermonImageUrl'];
                  final dynamic sermonVideoUrl = document['sermonVideoUrl'];
                  final dynamic sermonSpeaker = document['sermonSpeaker'];

                  final dynamic sermon = Sermon(
                      sermonName,
                      sermonDescription,
                      sermonAudioUrl,
                      sermonDate,
                      sermonImageUrl,
                      sermonSpeaker,
                      sermonVideoUrl);
                  return Material(
                    child: GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: VeggieCard(sermon),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
