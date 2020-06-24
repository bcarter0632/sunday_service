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
import 'package:intl/intl.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:sundayservice/models/event.dart';
import 'package:sundayservice/util/dateformat.dart';
import 'package:sundayservice/widgets/mapview.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;

  EventDetailsPage({Key key, @required this.event}) : super(key: key);

//  @override
//  _SermonDetailsPageState createState() => _SermonDetailsPageState();
//}

//class _SermonDetailsPageState extends State<SermonDetailsPage> {

  openMapsSheet(context) async {
    try {
      final title = "Shanghai Tower";
      final description = "Asia's tallest building";
      final coords = Coords(31.233568, 121.505504);
      final availableMaps = await MapLauncher.installedMaps;

      TargetPlatform platform = Theme.of(context).platform;
      print(platform);
      if (platform == TargetPlatform.android) {
        showPlatformModalSheet(
          context: context,
          builder: (BuildContext context) {
            return Material(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    child: Wrap(
                      children: <Widget>[
                        for (var map in availableMaps)
                          ListTile(
                            onTap: () => map.showMarker(
                              coords: coords,
                              title: title,
                              description: description,
                            ),
                            title: Text(map.mapName),
                            leading: Image(
                              image: map.icon,
                              height: 30.0,
                              width: 30.0,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      } else {
        showCupertinoModalPopup(
          context: context,
          builder: (builder) => CupertinoActionSheet(
            title: const Text('Selection'),
            message: const Text('Select Navigation App '),
            actions: <Widget>[
              for (var map in availableMaps)
              CupertinoActionSheetAction(
                child: PlatformText(map.mapName),
                onPressed: () async {
                  await MapLauncher.launchMap(
                    mapType: map.mapType,
                    coords: coords,
                    title: title,
                    description: description,
                  );
                },
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(
          event.eventName,
          style: TextStyle(color: Colors.white),
        ),
        ios: (_) => CupertinoNavigationBarData(
          heroTag: 'eventDetailsPage',
          transitionBetweenRoutes: false,
          leading: PlatformButton(
            padding: EdgeInsets.all(4.0),
            child: Icon(CupertinoIcons.back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          trailing: PlatformButton(
            padding: EdgeInsets.all(4.0),
            child: Icon(Icons.add_alarm, color: Colors.white),
            onPressed: () {
              // add to calendar
            },
          ),
        ),
        android: (_) => MaterialAppBarData(actions: <Widget>[
          PlatformIconButton(
            color: Colors.white,
            padding: EdgeInsets.all(4.0),
            icon: Icon(Icons.add_alarm),
            onPressed: () {
              // add to calendar
            },
          ),
        ]),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            padding: const EdgeInsets.all(2),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    height: 100,
//              height: isInSeason ? 300 : 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: null,
//                  Styles.desaturatedColorFilter,
                        image: AssetImage(
                          "images/abstractCross.jpg",
                        ),
                      ),
                    ),
                  ),
                  PlatformText(
                    event.eventName,
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
                        DateFormatUtil.getFullDateTimeForDisplayFromDate(
                            event.eventDate),
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.location,
                        size: 16.0,
                      ),
                      SizedBox(width: 5),
                      PlatformText(
                        event.eventLocation,
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Colors.black.withOpacity(0.10),
                thickness: 1.0,
              ),
              PlatformText(
                event.eventDescription,
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w200,
                ),
              ),
              Divider(
                color: Colors.black.withOpacity(0.10),
                thickness: 1.0,
              ),
//              PlatformText(event.eventFullAddress),
//              PlatformText(event.eventLocation),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.directions_car,
                        size: 16.0,
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          openMapsSheet(context);
//                          showCupertinoModalPopup(
//                            context: context,
//                            builder: (builder) => CupertinoActionSheet(
//                              title: const Text('Selection'),
//                              message: const Text('Select Navigation App '),
//                              actions: <Widget>[
//                                CupertinoActionSheetAction(
//                                  child: const Text('Apple Maps'),
//                                  onPressed: () {
//                                    Navigator.pop(context, 'One');
//                                  },
//                                ),
//                                CupertinoActionSheetAction(
//                                  child: const Text('Google Maps'),
//                                  onPressed: () {
//                                    Navigator.pop(context, 'Two');
//                                  },
//                                ),
//                                CupertinoActionSheetAction(
//                                  child: const Text('Waze'),
//                                  onPressed: () {
//                                    Navigator.pop(context, 'Two');
//                                  },
//                                )
//                              ],
//                            ),
//                          );
                        },
                        child: PlatformText(
                          event.eventFullAddress,
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GoogleMapView(),
            ],
          ),
        ),
      ),
    );
  }
}
