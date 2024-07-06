import 'package:flutter/material.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Image.network(img2, height: 32),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.confirmation_number))
        ],
        
      ),
    );
  }
}