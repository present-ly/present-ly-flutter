import 'package:flutter/material.dart';
import 'package:presently/blocs/friend_bloc.dart';
import 'package:presently/models/friend.dart';
import 'package:presently/screens/add_friend.dart';
import 'package:presently/screens/friend_detail.dart';

class FriendListScreen extends StatelessWidget {
  String generateInitials(String firstName, String lastName) {
    return '${firstName[0] + lastName[0]}';
  }

  @override
  Widget build(BuildContext context) {
    final bloc = FriendsProvider.of(context);
    bloc.getFriends();
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
      body: Container(child: buildFriendsList(context, bloc)),
    );
  }

  Widget buildFriendsList(BuildContext context, FriendsBloc bloc) {
    return StreamBuilder(
      stream: bloc.friends,
      builder:
          (BuildContext context, AsyncSnapshot<List<FriendModel>> snapshot) {
        if (snapshot.hasError) {
          Text("An Error Occurred");
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.data.length == 0) {
          return new Text(
              "You don't have any friends yet.  Add one with the button below");
        } else {
          print(snapshot.data);
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () => Navigator.of(context).push(
                      new PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                            new FriendDetail(friend: snapshot.data[index]),
                      ),
                    ),
                leading: CircleAvatar(
                  backgroundColor: Colors.cyan,
                  child: Text(
                    generateInitials(snapshot.data[index].firstName,
                        snapshot.data[index].lastName),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                    '${snapshot.data[index].firstName} ${snapshot.data[index].lastName}'),
                subtitle: Text('Birthday: January 15th'),
                trailing: Icon(Icons.card_giftcard),
              );
            },
          );
        }
      },
    );
  }
}
