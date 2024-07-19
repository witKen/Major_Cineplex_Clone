import 'package:flutter/material.dart';
import 'package:major_cineplex/common/gradient_app_bar.dart';
import 'package:major_cineplex/state_management/language_const.dart';
import 'package:major_cineplex/state_management/languagesProvider.dart';
import 'package:provider/provider.dart';

class PromoScreen extends StatefulWidget {
  @override
  _PromoScreenState createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> with SingleTickerProviderStateMixin {
  int _langIndex = 0;
  Language _lang = Khmer();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _langIndex = context.watch<LanguagesProvider>().langIndex;
    _lang = context.watch<LanguagesProvider>().lang;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: GradientAppBar(
        title: _lang.promoLabel,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: _lang.onlinePromoLabel),
            Tab(text: _lang.onGroundPromoLabel),
          ],
          indicatorColor: Colors.yellow,
          labelColor: Colors.yellow,
          unselectedLabelColor: Colors.white,
          dividerHeight: 0,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(),
          Container(),
        ],
      ),
    );
  }
}

