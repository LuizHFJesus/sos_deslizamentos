import "package:flutter/material.dart";
import 'package:sos_deslizamentos_app/screens/ambientEducation_screen.dart';
import 'package:sos_deslizamentos_app/screens/chat_screen.dart';
import 'package:sos_deslizamentos_app/screens/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  final _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTappedItem(int _currentIndex){
    _pageController.jumpToPage(_currentIndex);
  }

  String titleAppBar(_currentIndex){
    String title;
    switch (_currentIndex){
      case 0:
        title = "Principal";
        break;
      case 1:
        title = "Educação Ambiental";
        break;
      case 2:
        title = "Reportar Problemas";
        break;
      case 3:
        title = "Perfil";
        break;
    }
    return title;
  }

  List<Widget> _screens = [
    HomeScreen(),
    AmbientEducationScreen(),
    Container(decoration: BoxDecoration(color: Colors.blue),),
    Container(decoration: BoxDecoration(color: Colors.redAccent),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(titleAppBar(_currentIndex)),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.chat_outlined),
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context)=>ChatScreen()
                  )
              );
            })
        ],
      ),

      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Principal",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Educação",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report_problem),
            label: "Reportar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
        onTap: _onTappedItem
      ),
    );
  }
}
