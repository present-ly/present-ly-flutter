import 'package:flutter/material.dart';
import 'package:presently/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  final authService = new AuthService();

  login() async {
    _loginFormKey.currentState.save();
    await authService.login(_email, _password, true);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/presently-logo.png",
                      fit: BoxFit.contain),
                  Theme(
                    data: ThemeData(
                      primaryColor: Colors.white,
                    ),
                    child: Form(
                      key: _loginFormKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(labelText: 'Email'),
                                onSaved: (String value) {
                                  this._email = value;
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: TextFormField(
                                obscureText: true,
                                decoration:
                                    InputDecoration(labelText: 'Password'),
                                onSaved: (String value) {
                                  this._password = value;
                                }),
                          ),
                          Container(
                            width: 200.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0)),
                              onPressed: () => login(),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: FlatButton(
                              onPressed: () {},
                              textColor: Colors.white,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
                  child: Text(
                    "Don't have an account?",
                    style: TextStyle(
                        fontSize: 20.0, color: Colors.white.withOpacity(0.8)),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "register");
                  },
                  child: Text(
                    "REGISTER NOW",
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
