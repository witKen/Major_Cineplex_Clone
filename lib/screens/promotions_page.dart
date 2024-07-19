import 'package:flutter/material.dart';
import 'package:major_cineplex/common/gradient_app_bar.dart';

class PromoteScreen extends StatefulWidget {
  const PromoteScreen({Key? key}) : super(key: key);

  @override
  _PromoteScreenState createState() => _PromoteScreenState();
}
class _PromoteScreenState extends State<PromoteScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Updated length to 2
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: 'Promotions',
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.search, color: Colors.orange),
        //   ),
        // ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.white,
          tabs: const [
            Tab(text: 'ONLINE PROMOTION'), // Updated tab
            Tab(text: 'ON GROUND PROMOTION'), // Updated tab
          ],
          indicatorColor: Colors.orange,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOnlinePromotionTab(), // New method for online promotion content
          _buildOnGroundPromotionTab(), // New method for on ground promotion content
        ],
      ),
    );
  }

  Widget _buildOnlinePromotionTab() {
  
    return const Center(
      child: Text('Online Promotion Content',
          style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildOnGroundPromotionTab() {
  
    return const Center(
      child: Text('On Ground Promotion Content',
          style: TextStyle(color: Colors.white)),
    );
  }
}
