import 'package:flutter/material.dart';
import 'package:major_cineplex/common/gradient_app_bar.dart';

class PromoScreen extends StatefulWidget {
  @override
  _PromoScreenState createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: GradientAppBar(
        title: 'Promotions',
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Online Promotion'),
            Tab(text: 'On Ground Promotion'),
          ],
          indicatorColor: Colors.yellow,
          labelColor: Colors.yellow,
          unselectedLabelColor: Colors.white,
          dividerHeight: 0,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Online Promotion Content', style: TextStyle(color: Colors.white))),
          Center(child: Text('On Ground Promotion Content', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}

