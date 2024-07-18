import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Color> gradientColors;
  final List<double> gradientStops;
  final Widget? leading;
  final List<Widget>? actions;

  const GradientAppBar({
    Key? key,
    required this.title,
    this.gradientColors = const [Color(0xFFAA0000), Color(0xFF2D0D0D)],
    this.gradientStops = const [0.0, 1.0],
    this.leading,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          stops: gradientStops,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: AppBar(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        centerTitle: true,
        titleSpacing: 0.0,
        leading: leading,
        actions: actions,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}