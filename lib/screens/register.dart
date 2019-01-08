import 'package:flutter/material.dart';
import 'package:presently/models/user.dart';
import 'package:presently/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() {
    return new RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _registerFormKey = new GlobalKey<FormState>();
  final user = new UserModel('', '', '', '', '', '', '', false, [], '', [], []);
  final authService = new AuthService();

  register() {
    this._registerFormKey.currentState.save();
    this.authService.register(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Form(
              key: _registerFormKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'First Name'),
                    onSaved: (value) => user.firstName = value,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Last Name'),
                    onSaved: (value) => user.lastName = value,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email'),
                    onSaved: (value) => user.email = value,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Confirm Email'),
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Password'),
                    onSaved: (value) => user.password = value,
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () => register(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "REGISTER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
