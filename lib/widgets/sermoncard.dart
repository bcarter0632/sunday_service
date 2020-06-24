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
    this.upElevation = 2,
    this.downElevation = 0,
    this.shadowColor = CupertinoColors.black,
    this.duration = const Duration(milliseconds: 100),
    this.onPressed,
    Key key,
  })  : assert(child != null),
        assert(borderRadius != null),
        assert(upElevation != null),
        assert(downElevation != null),
        assert(shadowColor != null),
        assert(duration != null),
        super(key: key);

  final VoidCallback onPressed;

  final Widget child;

  final BorderRadius borderRadius;

  final double upElevation;

  final double downElevation;

  final Color shadowColor;

  final Duration duration;

  @override
  _PressableCardState createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard> {
  bool cardIsDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => cardIsDown = false);
        if (widget.onPressed != null) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => setState(() => cardIsDown = true),
      onTapCancel: () => setState(() => cardIsDown = false),
      child: AnimatedPhysicalModel(
        elevation: cardIsDown ? widget.downElevation : widget.upElevation,
        borderRadius: widget.borderRadius,
        shape: BoxShape.rectangle,
        shadowColor: widget.shadowColor,
        duration: widget.duration,
        color: CupertinoColors.lightBackgroundGray,
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: widget.child,
        ),
      ),
    );
  }
}

class VeggieCard extends StatelessWidget {
  VeggieCard(this.sermon);

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
      onPressed: () {
        Navigator.of(context).push<void>(CupertinoPageRoute(
          builder: (context) => SermonDetailsPage(sermon: sermon),
        ));
      },
      child: Stack(
        children: [
          Semantics(
            label: 'A card background featuring ${sermon.sermonName}',
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter:
                  null,
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