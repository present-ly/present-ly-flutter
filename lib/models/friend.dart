import 'dart:convert';

import 'package:presently/models/event.dart';

class FriendModel {
  int id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String profilePicture;
  String relationship;
  List<String> interests;
  Map<Event, Event> events;

  FriendModel(this.firstName, this.lastName, this.email, this.phoneNumber,
      this.profilePicture, this.relationship, this.interests, this.events);

  FriendModel.fromDb(Map<String, dynamic> rawSQL)
      : id = rawSQL['id'],
        firstName = rawSQL['firstName'],
        lastName = rawSQL['lastName'],
        email = rawSQL['email'],
        phoneNumber = "$rawSQL['phoneNumber']",
        profilePicture = rawSQL['profilePicture'],
        relationship = rawSQL['relationship'],
        interests = new List<String>.from(jsonDecode(rawSQL['interests'])),
        events = jsonDecode(rawSQL['events']);

  Map<String, dynamic> toDB() {
    return <String, dynamic>{
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNumber": '$phoneNumber',
      "profilePicture": profilePicture,
      "relationship": relationship,
      "interests": jsonEncode(interests),
      "events": jsonEncode(events)
    };
  }

  static sortEvents(Map<String, dynamic> events) {}
}
