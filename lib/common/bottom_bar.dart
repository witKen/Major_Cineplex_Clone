import 'package:flutter/material.dart';
import 'package:major_cineplex/feature/home/home_screen.dart';
import 'package:major_cineplex/screens/cinemas_page.dart';
import 'package:major_cineplex/screens/promo_screen.dart';
import 'package:major_cineplex/screens/setting_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar(),
      backgroundColor: Colors.transparent
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: _pageIndex,
      children: [
        const HomeScreen(),
        const CinemasScreen(),
        PromoScreen(),
        const SettingScreen(),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.transparent,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        iconSize: 30,
        items: const [
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
        ],
      ),
    );
  }
}
