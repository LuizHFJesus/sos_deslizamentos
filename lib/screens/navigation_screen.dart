import "package:flutter/material.dart";

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
    Container(decoration: BoxDecoration(color: Colors.yellow),),
    Container(decoration: BoxDecoration(color: Colors.greenAccent),),
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
            title: Text("Principal"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text("Educação"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report_problem),
            title: Text("Reportar"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Perfil"),
          ),
        ],
        onTap: _onTappedItem
      ),
    );
  }
}
