import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title;
  final List<Color> gradientColors;
  final List<double> gradientStops;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool primary;

  const GradientAppBar({
    Key? key,
    required this.title,
    this.gradientColors = const [Color(0xFFAA0000), Color(0xFF2D0D0D)],
    this.gradientStops = const [0.0, 1.0],
    this.leading,
    this.actions,
    this.bottom,
    this.primary = true,
  }) : super(key: key);

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));

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
        title: title is String
            ? Text(
                title.toUpperCase(),
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            : title,
        // title: Text(
        //   title,
        //   style: const TextStyle(
        //     color: Colors.orange,
        //     fontSize: 24,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        centerTitle: true,
        titleSpacing: 0.0,
        leading: leading,
        actions: actions,
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: bottom,
        primary: primary,
      ),
    );
  }
}
