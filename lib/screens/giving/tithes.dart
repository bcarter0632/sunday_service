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
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class TithesAndOfferingsPage extends StatefulWidget {
  @override
  _TithesAndOfferingsPageState createState() => _TithesAndOfferingsPageState();
}

class _TithesAndOfferingsPageState extends State<TithesAndOfferingsPage> {

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
//        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        ios: (_) => CupertinoNavigationBarData(
          title: PlatformText("Tithes and Offerings"),
          heroTag: 'offeringsPage',
          transitionBetweenRoutes: false,
        ),
      ),
      body: Material(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: null,
                      image: AssetImage(
                        "images/abstractCross.jpg",
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.10),
                  thickness: 1.0,
                ),
                GestureDetector(
                  onTap: () => _launchInBrowser("https://www.givelify.com/givenow/1.0/NTM2OTc=/selection"),
                  child: ListTile(
                    leading: Icon(
                      Icons.card_giftcard,
                      size: 25,
                    ),
                    title: PlatformText("Tithes and Offerings"),
                    subtitle: PlatformText("Giving through Givlify"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.10),
                  thickness: 1.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
