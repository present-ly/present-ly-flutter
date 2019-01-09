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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _email = '';
  String _password = '';
  final authService = new AuthService();

  login() async {
    _loginFormKey.currentState.save();
    var returnedUser = await authService.login(_email, _password, true);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
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
              margin: EdgeInsets.only(bottom: 32.0),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Image.asset(
                      "assets/images/przzy-plum.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Form(
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
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: FlatButton(
                            onPressed: () {},
                            textColor: Theme.of(context).primaryColor,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Container(
                      width: 200.0,
                      child: RaisedButton(
                        onPressed: () {
                          login();
                          final snackbar =
                              SnackBar(content: Text('SNACKBAR ERROR TEXT!'));
                          _scaffoldKey.currentState.showSnackBar(snackbar);
                          // Navigator.of(context).pushNamedAndRemoveUntil(
                          //'navbar', (Route<dynamic> route) => false);
                        },
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, "register");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xff6378EA),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
