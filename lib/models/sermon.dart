import 'package:cloud_firestore/cloud_firestore.dart';

class Sermon {
  final String sermonName;
  final String sermonDescription;
  final String sermonSpeaker;
  final String sermonAudioUrl;
  final String sermonVideoUrl;
  final String sermonImageUrl;
  final Timestamp sermonDate;

  Sermon(
      this.sermonName,
      this.sermonDescription,
      this.sermonAudioUrl,
      this.sermonDate,
      this.sermonImageUrl,
      this.sermonSpeaker,
      this.sermonVideoUrl);
}
