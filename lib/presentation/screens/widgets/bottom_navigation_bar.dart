import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 8,
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _navItem(Icons.home, 0),
                _navItem(Icons.search, 1),
                _navItem(Icons.bookmark_border, 2),
              ],
            ),
            Row(
              children: [
                _navItem(Icons.play_circle_outline, 3),
                _navItem(Icons.notifications_none, 4),
                _navItem(Icons.person_outline, 5),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    final isSelected = currentIndex == index;
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? Colors.indigo[900] : Colors.grey,
        size: 24,
      ),
      onPressed: () {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}