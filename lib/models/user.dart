import 'package:presently/models/event.dart';
import 'package:presently/models/friend.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  String profilePictureURL;
  bool isActive;
  List<EventModel> events;
  String confirmed;
  List<String> interests;
  List<FriendModel> friends;

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "profilePictureUrl": profilePictureURL,
        "isActive": isActive,
        "events": events,
        "confirmed": confirmed,
        "interests": interests,
        "friends": friends,
      };

  UserModel(
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phoneNumber,
      this.profilePictureURL,
      this.isActive,
      this.events,
      this.confirmed,
      this.interests,
      this.friends);
}
