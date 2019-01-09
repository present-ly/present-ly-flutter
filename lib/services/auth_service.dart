import 'package:http/http.dart' as http;
import 'package:presently/models/user.dart';

class AuthService {
  final url = "http://localhost:3000/auth";
  Future<UserModel> login(String email, String password, bool remember) async {
    var loginCredentials = {
      "email": email,
      "password": password,
      "remember": remember.toString()
    };
    final response = await http.post("$url/login", body: loginCredentials);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.body);
    } else {}
  }

  Future<UserModel> register(UserModel user) async {
    //TODO find a way to move these into the UserModel class.
    var jsonBody = {
      "id": user.id,
      "firstName": user.firstName,
      "lastName": user.lastName,
      "email": user.email,
      "password": user.password,
      "phoneNumber": user.phoneNumber,
      "profilePictureUrl": user.profilePictureURL,
      "isActive": user.isActive.toString(),
      "events": user.events.toString(),
      "confirmed": user.confirmed,
      "interests": user.interests.toString(),
      "friends": user.friends.toString(),
    };
    final response = await http.post("$url/register", body: jsonBody);
    print(response.body);
  }
}
