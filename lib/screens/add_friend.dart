import 'package:flutter/material.dart';
import 'package:presently/models/friend.dart';
import 'package:presently/services/db.dart';

class AddFriend extends StatefulWidget {
  @override
  AddFriendState createState() {
    return new AddFriendState();
  }
}

class AddFriendState extends State<AddFriend> {
  List<TextEditingController> eventTextControllers = [];
  List<DateTime> eventDates = [];
  int eventNumber = 1;
  final DateTime _date = DateTime.now();
  final _createFriendFormKey = GlobalKey<FormState>();
  final DatabaseService db = new DatabaseService();
  final FriendModel friend = new FriendModel(
    '',
    '',
    '',
    '',
    '',
    '',
    [],
    [],
  );

  addEvent() {
    this.eventNumber++;
  }

  removeEvent() {
    if (this.eventNumber == 1) {
      return;
    }
    this.eventNumber--;
  }

  generateTextEditingControllers() {
    if (eventNumber == 0) {
      eventTextControllers.add(new TextEditingController());
      this.eventDates.add(DateTime.now());
    }
    for (var i = 0; i < eventNumber; i++) {
      eventTextControllers.add(new TextEditingController());
      this.eventDates.add(DateTime.now());
    }
  }

  submitAddFriendForm() {
    this._createFriendFormKey.currentState.save();
    for (var i = 0; i < eventNumber; i++) {
      friend.events.add(
          {eventTextControllers[i].text: eventDates[i].millisecondsSinceEpoch});
    }
    this.db.addFriend(friend);
  }

  Future<Null> selectDate(BuildContext context, int index) async {
    final DateTime event = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2020),
    );
    this.eventDates[index] = event;
  }

  @override
  Widget build(BuildContext context) {
    generateTextEditingControllers();
    List<Widget> list = List.generate(
      eventNumber,
      (int i) => EventField(context, i),
    );
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('Add New Friend')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Form(
              key: this._createFriendFormKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'First Name'),
                    textCapitalization: TextCapitalization.words,
                    onSaved: (value) => friend.firstName = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                    textCapitalization: TextCapitalization.words,
                    onSaved: (value) => friend.lastName = value,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email'),
                    onSaved: (value) => friend.email = value,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: 'Phone'),
                    onSaved: (value) => friend.phoneNumber = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Relationship (e.g., spouse)"),
                    onSaved: (value) => friend.relationship = value,
                  ),
                  Column(children: list),
                  RaisedButton(
                    onPressed: () => setState(() => this.eventNumber++),
                    child: Text('Add New Event'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    onPressed: () => submitAddFriendForm(),
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
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

  Widget EventField(BuildContext context, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () => selectDate(context, index),
        ),
        Flexible(
          child: TextFormField(
            controller: eventTextControllers[index],
            decoration: InputDecoration(labelText: "Event Title"),
          ),
        ),
        IconButton(
          onPressed: () => this.setState(() => removeEvent()),
          icon: Icon(Icons.delete),
        )
      ],
    );
  }
}
