import 'package:flutter/material.dart';

class BottomNavBarCustom extends StatefulWidget {
  const BottomNavBarCustom(
      {super.key,
      required this.items,
      required this.onTap,
      required this.currentIndex,
      required this.backgroundColor,
      required this.elevation,
      required this.iconSize,
      required this.colorIconSelectedIconTheme,
      required this.iconSizeSelectedIconTheme,
      required this.selectedItemColor,
      required this.colorIconUnSelectedIconTheme,
      required this.unSelectedItemColor});

  @override
  State<BottomNavBarCustom> createState() => _BottomNavBarCustomState();
  final List<BottomNavigationBarItem> items;
  final void Function(int) onTap;
  final int currentIndex;
  final Color backgroundColor;
  final double elevation;
  final double iconSize;
  final double iconSizeSelectedIconTheme;
  final Color colorIconSelectedIconTheme;
  final Color colorIconUnSelectedIconTheme;
  final Color selectedItemColor;
  final Color unSelectedItemColor;
}

class _BottomNavBarCustomState extends State<BottomNavBarCustom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      onTap: widget.onTap,
      items: widget.items,
      currentIndex: widget.currentIndex,
      backgroundColor: widget.backgroundColor,
      elevation: widget.elevation,
      iconSize: widget.iconSize,
      selectedFontSize: 20,
      selectedIconTheme: IconThemeData(
          color: widget.colorIconSelectedIconTheme,
          size: widget.iconSizeSelectedIconTheme),
      selectedItemColor: widget.selectedItemColor,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedIconTheme: IconThemeData(
        color: widget.colorIconUnSelectedIconTheme,
      ),
      unselectedItemColor: widget.unSelectedItemColor,
    );
  }
}
