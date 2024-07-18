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
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Colors.orange)),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: imageHeight,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _imagePaths.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  _imagePaths[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // Add any additional widgets below
        ],
      ),
      backgroundColor: Colors.black,
      body: _buildBody(),
    );
  }

}

