import 'package:flutter/material.dart';

class AddFriend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('Add New Friend')),
      body: Container(
        child: Column(
          children: <Widget>[
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: 'Phone'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Address'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Relationship (e.g., spouse)"),
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: "Events (e.g., Birthday)"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
