import 'package:flutter/material.dart';
import 'package:major_cineplex/common/gradient_app_bar.dart';

class CinemasScreen extends StatefulWidget {
  const CinemasScreen({super.key});

  @override
  _CinemasScreenState createState() => _CinemasScreenState();
}

class _CinemasScreenState extends State<CinemasScreen>
    with SingleTickerProviderStateMixin {
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
      appBar: GradientAppBar(
        title: 'Cinemas',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.orange),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.white,
          dividerHeight: 0,
          tabs: const [
            Tab(text: 'FAVORITE'),
            Tab(text: 'CINEMAS'),
            Tab(text: 'SYSTEM TYPE'),
          ],
          indicatorColor: Colors.orange,
        ),
      ),
      backgroundColor: Colors.black,
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFavoriteTab(),
          _buildCinemasTab(),
          _buildSystemTypeTab(),
        ],
      ),
    );
  }

  Widget _buildFavoriteTab() {
    return const Center(
      child: Text('Favorite Tab', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildCinemasTab() {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Colors.yellow),
                const SizedBox(width: 10),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      // Add functionality to find nearby cinema
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.yellow,
                    ),
                    child: const Text('Find my nearby cinema'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                ExpansionTile(
                  leading: Icon(Icons.location_on, color: Colors.orange),
                  title: Text(
                    'MAJOR CINEPLEX BY SMART',
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ListTile(
                      leading: Text(''),
                      title: Text('Major Aeon Mall Phnom Penh',
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(Icons.star_border, color: Colors.white),
                    ),
                    ListTile(
                      leading: Text(''),
                      title: Text('Major Cineplex Aeon Sen Sok',
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(Icons.star_border, color: Colors.white),
                    ),
                    ListTile(
                      leading: Text(''),
                      title: Text('Major Cineplex Aeon Mean Chey',
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(Icons.star_border, color: Colors.white),
                    ),
                    ListTile(
                      leading: Text(''),
                      title: Text('Major Cineplex Sorya',
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(Icons.star_border, color: Colors.white),
                    ),
                    ListTile(
                      leading: Text(''),
                      title: Text('Major Platinum Siem Reap',
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(Icons.star_border, color: Colors.white),
                    ),
                    ListTile(
                      leading: Text(''),
                      title: Text('Major Cineplex Big C Poipet',
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(Icons.star_border, color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSystemTypeTab() {
    return const Center(
      child: Text('System Type Tab', style: TextStyle(color: Colors.white)),
    );
  }
}
