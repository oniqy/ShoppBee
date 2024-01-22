import 'package:flutter/material.dart';
import 'package:shop_bee/page/Catalogue.dart';
import 'package:shop_bee/page/HomePage.dart';
import 'package:shop_bee/page/LoginPage.dart';
import 'package:shop_bee/page/BrandPage.dart';
import 'package:shop_bee/page/NotificationPage.dart';
import 'package:shop_bee/page/User_InfomationPage.dart';

void main() {
  runApp( MaterialApp(home: LoginPage(),) );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int currentPage = 0;
  void NavigatorPage(int index){
    setState(() {
      currentPage = index;
    });
  }
  final List _page=[
    HomePage(),
    BrandPage(),
    CataloguePage(),
    NotificationPage(),
    UserInfoPage()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _page[currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          selectedItemColor: Colors.teal,
          onTap: NavigatorPage,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme:IconThemeData(color: Colors.teal),
          items:const [
            BottomNavigationBarItem(icon: Icon(Icons.home,size: 30),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.local_mall,size: 30),label: 'Brand'),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize,size: 30),label:'Catalogue'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_active,size: 30),label: 'Notification'),
            BottomNavigationBarItem(icon: Icon(Icons.person,size: 30),label: 'User')
          ],
        ),
      ),
    );
  }
}
