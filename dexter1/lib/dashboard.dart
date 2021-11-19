import 'package:dexter1/ui/articles/articles.dart';
import 'package:dexter1/ui/favourites.dart';
import 'package:dexter1/ui/homepage.dart';
import 'package:dexter1/ui/profile.dart';
import 'package:dexter1/ui/settings.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController? _pageController;
  int bottomNavigationBarIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.pinkAccent,
        currentIndex: bottomNavigationBarIndex,
        onTap: (index) {
          setState(() {
            bottomNavigationBarIndex = index;
          });
          _pageController!.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_open_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            bottomNavigationBarIndex = index;
          });
        },
        children: [
          HomePage(),
          Articles(),
          Favourites(),
          Profile(),
          Settings(),
        ],
      ),
    );
  }
}
