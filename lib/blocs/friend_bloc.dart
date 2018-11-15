import 'package:flutter/material.dart';
import 'package:presently/models/friend.dart';
import 'package:presently/services/db.dart';
import 'package:rxdart/rxdart.dart';

class FriendsBloc {
  final _database = dbService;
  final _friends = PublishSubject<List<FriendModel>>();

  Observable<List<FriendModel>> get friends => _friends.stream;

  getFriends() async {
    final friends = await _database.getFriends();
    _friends.sink.add(friends);
  }

  addFriends(FriendModel friend) async {
    _database.addFriend(friend);
  }

  void dispose() {
    _friends.close();
  }
}

class FriendsProvider extends InheritedWidget {
  final FriendsBloc bloc;

  FriendsProvider({Key key, Widget child})
      : bloc = FriendsBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static FriendsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(FriendsProvider)
            as FriendsProvider)
        .bloc;
  }
}
