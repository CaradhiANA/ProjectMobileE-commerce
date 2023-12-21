import 'package:ecommerce/pages/cart.dart';
import 'package:ecommerce/pages/explore.dart';
import 'package:ecommerce/pages/profile.dart';
import 'package:ecommerce/pages/search.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/pages/comment.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _selectedPage = 0;

  List<Widget> pages = [
    ExplorePage(),
    SearchPage(),
    CartPage(),
    TestMe(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) => setState(() { _selectedPage = index; }),
        controller: _pageController,
        children: [
          ...pages
        ],
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedPage,
        showElevation: false,
        onItemSelected: (index) => _onItemTapped(index),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home_outlined, size: 23),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.search, size: 23),
            title: Text('Search'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.shopping_bag_outlined, size: 23),
            title: Text('Cart'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.comment_outlined, size: 23,),
            title: Text('Comments'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.account_circle_outlined, size: 23,),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
