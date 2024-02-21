import 'package:flutter/material.dart';

class BottomNavBarCustomization extends StatefulWidget {
  const BottomNavBarCustomization(
      {super.key,
      required this.items,
      required this.backgroundColor,
      required this.elevation,
      this.mouseCursor,
      required this.selectedFontSize,
      required this.selectedIconColor,
      required this.iconSize,
      required this.unselectedIconColor,
      required this.unselectedItemColor});
  final List<BottomNavigationBarItem> items;
  final Color backgroundColor;
  final double elevation;
  final MouseCursor? mouseCursor;
  final double selectedFontSize;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final double iconSize;
  final Color unselectedItemColor;

  @override
  State<BottomNavBarCustomization> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BottomNavBarCustomization> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.shifting,
      selectedFontSize: widget.selectedFontSize,
      selectedIconTheme:
          IconThemeData(color: widget.selectedIconColor, size: widget.iconSize),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedIconTheme: IconThemeData(
        color: widget.unselectedIconColor,
      ),
      unselectedItemColor: widget.unselectedItemColor,
      mouseCursor: widget.mouseCursor,
      elevation: widget.elevation,
      backgroundColor: widget.backgroundColor,
      items: widget.items,
    );
  }
}
