import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Upcoming Events',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Chip(
                      label: Text(
                        'BIRTHDAY',
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                      backgroundColor: Colors.purple,
                    ),
                  ),
                  ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue,
                          radius: 32.0,
                          child: Text('FA',
                              style: TextStyle(color: Colors.white))),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Fred Arden',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.w400),
                        ),
                      ),
                      subtitle: Text(
                        'Give Fred the perfect gift!',
                        style: TextStyle(fontSize: 20.0),
                      )),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            'GIFT',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          onPressed: () => {},
                        ),
                        FlatButton(
                          child:
                              Text('PROFILE', style: TextStyle(fontSize: 16.0)),
                          onPressed: () => {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Suggested For You',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Add interests to your profile to see our recommendations!',
                ),
              ),
            ),
            Center(
              child: RaisedButton(
                color: Colors.purple[500],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                child: Text(
                  'Update Profile',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
