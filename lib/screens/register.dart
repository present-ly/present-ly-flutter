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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0, 1],
              colors: [Theme.of(context).primaryColor, Color(0xffB480F6)]),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(24.0),
              margin: EdgeInsets.only(left: 16.0, bottom: 32.0, right: 16.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 4.0,
                      blurRadius: 12.0,
                      offset: Offset(4.0, 8.0),
                      color: Colors.black12,
                    )
                  ]),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: IconButton(
                      alignment: Alignment.topRight,
                      iconSize: 40.0,
                      color: Theme.of(context).primaryColor,
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Image.asset(
                      "assets/images/przzy-plum.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Form(
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
                          decoration:
                              InputDecoration(labelText: 'Confirm Email'),
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
                          decoration:
                              InputDecoration(labelText: 'Confirm Password'),
                        ),
                        Container(padding: EdgeInsets.only(bottom: 16.0)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 200.0,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
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
      ),
    );
  }
}
