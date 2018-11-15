import 'package:flutter/material.dart';
import 'package:presently/blocs/friend_bloc.dart';
import 'package:presently/screens/cart.dart';
import 'package:presently/screens/friend_list.dart';
import 'package:presently/screens/home.dart';

class PresentlyTabBar extends StatefulWidget {
  @override
  PresentlyTabBarState createState() {
    return new PresentlyTabBarState();
  }
}

class PresentlyTabBarState extends State<PresentlyTabBar> {
  int _selectedIndex = 0;
  final _widgetOptions = <Widget>[
    HomeScreen(),
    FriendListScreen(),
    CartScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FriendsProvider(
      child: Scaffold(
        body: Center(
            child: _widgetOptions.elementAt(
          _selectedIndex,
        )),
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.group), title: Text('Friends')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_shopping_cart), title: Text('Cart')),
            ],
            currentIndex: _selectedIndex,
            fixedColor: Colors.purple,
            onTap: _onItemTapped),
      ),
    );
  }
}
