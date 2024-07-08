import 'package:flutter/material.dart';
import 'package:major_cineplex/common/gradient_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String img2 = "https://i.pinimg.com/474x/4d/32/5c/4d325cf1ba05cb71037e17467e5083bd.jpg";
    return Scaffold(
      appBar: GradientAppBar(
        title: 'Major',
        actions: [
          IconButton(
            onPressed: (){}, icon: Icon(Icons.menu, color: Colors.orange))
        ],  
      ),
      backgroundColor: Colors.black87,
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBody(){
    return IndexedStack(
      index: _navIndex,
      children: [
        Container(color: Colors.purple,),
        Container(color: Colors.black,),
        Container(color: Colors.pink,),
        Container(color: Colors.white,),
      ],
    );
  }

  int _navIndex = 0;

  Widget _buildBottomNavBar(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: BottomNavigationBar(
        currentIndex: _navIndex,
        onTap: (index){
          setState(() {
            _navIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.transparent,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: 'MOVIES',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'CINEMAS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: 'PROMOTIONS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'SETTING',
              
          ),
        ]
      )
    );
  }
}