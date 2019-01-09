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
  String token;
  bool isActive;
  List<EventModel> events;
  String confirmed;
  List<String> interests;
  List<FriendModel> friends;

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        password = json['password'],
        phoneNumber = json['phoneNumber'],
        profilePictureURL = json['profilePictureUrl'],
        token = json['token'],
        isActive = json['isActive'],
        events = json['events'],
        confirmed = json['confirmed'],
        interests = json['interests'],
        friends = json['friends'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "token": token,
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
