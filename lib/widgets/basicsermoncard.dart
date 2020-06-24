import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:sundayservice/models/sermon.dart';
import 'package:sundayservice/screens/sermons/sermonDetails.dart';

import '../styles.dart';

class FrostyBackground extends StatelessWidget {
  const FrostyBackground({
    this.color,
    this.intensity = 25,
    this.child,
  });

  final Color color;
  final double intensity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: intensity, sigmaY: intensity),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
          ),
          child: child,
        ),
      ),
    );
  }
}

/// A Card-like Widget that responds to tap events by animating changes to its
/// elevation and invoking an optional [onPressed] callback.
class PressableCard extends StatefulWidget {
  const PressableCard({
    @required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.shadowColor = CupertinoColors.black,
    Key key,
  })  : assert(child != null),
        assert(borderRadius != null),
        assert(shadowColor != null),
        super(key: key);

  final Widget child;

  final BorderRadius borderRadius;

  final Color shadowColor;

  @override
  _PressableCardState createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard> {
  bool cardIsDown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: widget.borderRadius,
        child: widget.child,
      ),
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.inactiveGray,
            spreadRadius: 0,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: CupertinoColors.extraLightBackgroundGray,
      ),
    );
  }
}

//boxShadow: [
//BoxShadow(
//color: Colors.grey.withOpacity(0.5),
//spreadRadius: 5,
//blurRadius: 7,
//offset: Offset(0, 3), // changes position of shadow
//),
//],
class BasicSermonCard extends StatelessWidget {
  BasicSermonCard(this.sermon);

  /// Veggie to be displayed by the card.
  final Sermon sermon;

  /// If the veggie is in season, it's displayed more prominently and the
  /// image is fully saturated. Otherwise, it's reduced and de-saturated.
//  final bool isInSeason;

  /// Whether [veggie] falls into one of user's preferred [VeggieCategory]s
//  final bool isPreferredCategory;

  Widget _buildDetails() {
    return FrostyBackground(
      color: Color(0x90ffffff),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              DateFormat.yMMMMd().format(sermon.sermonDate.toDate()),
              style: Styles.cardDescriptionText,
            ),
            Text(
              sermon.sermonName,
              style: Styles.cardTitleText,
            ),
            Text(
              sermon.sermonSpeaker,
              style: Styles.cardDescriptionText,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      child: Stack(
        children: [
          Semantics(
            label: 'A card background featuring ${sermon.sermonName}',
            child: Container(
              height: 300,
//              height: isInSeason ? 300 : 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: null,
//                  Styles.desaturatedColorFilter,
                  image: AssetImage(
                    sermon.sermonImageUrl,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildDetails(),
          ),
        ],
      ),
    );
  }
}
