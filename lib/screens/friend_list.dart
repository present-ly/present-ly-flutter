import 'package:flutter/material.dart';
import 'package:presently/screens/add_friend.dart';

class FriendListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFriend()),
          );
        },
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        child: Icon(Icons.person_add),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Text(
                  'JD',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text('Jane Doe'),
              subtitle: Text('Birthday: January 15th'),
              trailing: Icon(Icons.card_giftcard),
            ),
          ],
        ),
      ),
    );
  }
}
