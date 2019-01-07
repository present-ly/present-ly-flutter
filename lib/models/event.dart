import 'package:presently/models/friend.dart';

class EventModel implements Comparable<EventModel> {
  String id;
  FriendModel belongsTo;
  FriendModel owner;
  String name;
  DateTime date;
  @override
  int compareTo(EventModel other) {
    return this.date.compareTo(other.date);
  }
}
