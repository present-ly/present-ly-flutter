import 'package:flutter/material.dart';
import 'package:presently/models/friend.dart';

class FriendDetail extends StatelessWidget {
  FriendModel friend;
  FriendDetail({this.friend});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("${friend.firstName}"),
    );
  }
}
