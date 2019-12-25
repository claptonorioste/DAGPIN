import 'package:flutter/material.dart';

import 'home.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  int _currentPage = 0;
  final List<Widget> _pages = [Home(), Text("Tab 2"),Text("Tab 3")];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CAREHERE"),
        ),
        body: _pages[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: onTapPaged, 
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        currentIndex:
            _currentPage, 

        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            title: Text(
              'Diary',
              style: TextStyle(color: Colors.white),
            ),
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text(
              'Chat',
              style: TextStyle(color: Colors.white),
            ),
          )        
        ],
      ),);
  }
   void onTapPaged(int index) {
    print(index);
    setState(() {
      _currentPage = index;
    });
  }
}
