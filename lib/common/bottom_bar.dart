import 'package:flutter/material.dart';
import 'package:major_cineplex/feature/home/home_screen.dart';
import 'package:major_cineplex/screens/cinemas_page.dart';
import 'package:major_cineplex/screens/promo_screen.dart';
import 'package:major_cineplex/screens/setting_screen.dart';
import 'package:major_cineplex/state_management/language_const.dart';
import 'package:major_cineplex/state_management/languagesProvider.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _pageIndex = 0;
  int _langIndex = 0;
  Language _lang = Khmer();

  @override
  Widget build(BuildContext context) {
    _langIndex = context.watch<LanguagesProvider>().langIndex;
    _lang = context.watch<LanguagesProvider>().lang;
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
        selectedFontSize: _langIndex == 1 ? 12 : 15,
        unselectedFontSize: _langIndex == 1 ? 12 : 15,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.movie_creation_outlined),
            label: _lang.movieLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.location_on_outlined),
            label: _lang.cineLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.local_offer_outlined),
            label: _lang.promoLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            label: _lang.settingLabel,
          ),
        ],
      ),
    );
  }
}
