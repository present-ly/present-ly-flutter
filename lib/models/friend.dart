import 'package:presently/models/event.dart';
import 'package:presently/models/user.dart';

class FriendModel {
  String id;
  UserModel profile;
  List<EventModel> events;
  List<String> interests;

//  FriendModel(this.firstName, this.lastName, this.email, this.phoneNumber,
//      this.profilePicture, this.relationship, this.interests, this.events);
//
//  FriendModel.fromDb(Map<String, dynamic> rawSQL)
//      : id = rawSQL['id'],
//        firstName = rawSQL['firstName'],
//        lastName = rawSQL['lastName'],
//        email = rawSQL['email'],
//        phoneNumber = "$rawSQL['phoneNumber']",
//        profilePicture = rawSQL['profilePicture'],
//        relationship = rawSQL['relationship'],
//        interests = new List<String>.from(jsonDecode(rawSQL['interests'])),
//        events = jsonDecode(rawSQL['events']);
//
//  Map<String, dynamic> toDB() {
//    return <String, dynamic>{
//      "id": id,
//      "firstName": firstName,
//      "lastName": lastName,
//      "email": email,
//      "phoneNumber": '$phoneNumber',
//      "profilePicture": profilePicture,
//      "relationship": relationship,
//      "interests": jsonEncode(interests),
//      "events": jsonEncode(events)
//    };
//  }
//
//  //Pull out all of the events put them in a list.
//
//  static List<EventModel> sortEvents(Map<String, EventModel> events) {
//    var eventList = new List.of(events.values);
//    eventList.sort();
//    return eventList;
//  }
}
