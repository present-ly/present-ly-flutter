import 'dart:collection';
import 'dart:convert';

class FriendModel {
  int id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String profilePicture;
  String relationship;
  List<String> interests;
  List<Map<String, dynamic>> events;

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
        events =
            new List<Map<String, dynamic>>.from(jsonDecode(rawSQL['events']));

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

  static sortEvents(List<Map<String, dynamic>> events) {
    for (var event in events) {
      var sortedKeys = event.keys.toList(growable: false)
        ..sort((a, b) => event[a].compareTo(event[b]));
      LinkedHashMap sortedMap = new LinkedHashMap.fromIterable(sortedKeys,
          key: (k) => k, value: (k) => event[k]);
    }
  }
}
