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
import 'package:sundayservice/models/event.dart';
import 'package:sundayservice/util/dateformat.dart';

import 'eventDetails.dart';

class EventsListPage extends StatefulWidget {
  @override
  _EventsListPageState createState() => _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText("Events"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection("events")
                .orderBy("eventDate", descending: false)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return PlatformCircularProgressIndicator();
              final int messageCount = snapshot.data.documents.length;
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Colors.black.withOpacity(0.10),
                  thickness: 1.0,
                ),
                itemCount: messageCount,
                itemBuilder: (_, int index) {
                  final DocumentSnapshot document =
                      snapshot.data.documents[index];
                  final dynamic eventName = document['eventName'];
                  final dynamic eventDate = document['eventDate'];
                  final dynamic eventDescription = document['eventDescription'];
                  final dynamic eventFullAddress = document['eventFullAddress'];
                  final dynamic eventLocation = document['eventLocation'];

                  final dynamic event = Event(eventName, eventDescription,
                      eventDate, eventFullAddress, eventLocation);
                  return Material(
                    child: GestureDetector(
                      child: Container(
                        height: 80,
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                PlatformText(
                                  DateFormatUtil.getAbreviatedMonthFromDate(eventDate).toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                PlatformText(
                                  DateFormatUtil.getDayFromDate(eventDate),
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 18),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                PlatformText(
                                  eventName,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      CupertinoIcons.clock,
                                      size: 16.0,
                                    ),
                                    SizedBox(width: 5),
                                    PlatformText(
                                      DateFormatUtil.getTimeFromDate(eventDate),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      CupertinoIcons.location,
                                      size: 16.0,
                                    ),
                                    SizedBox(width: 5),
                                    PlatformText(
                                      eventLocation,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailsPage(event: event),
                        ),
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
