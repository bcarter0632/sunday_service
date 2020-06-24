import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String eventName;
  final String eventDescription;
  final Timestamp eventDate;
  final String eventFullAddress;
  final String eventLocation;

  Event(this.eventName, this.eventDescription, this.eventDate,
      this.eventFullAddress, this.eventLocation);
}
