import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Footer extends StatefulWidget {
  const Footer({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    var navigationShell = widget.navigationShell;

    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 255, 245, 237),
        selectedItemColor: const Color.fromARGB(255, 252, 201, 188),
        unselectedItemColor: const Color.fromARGB(76, 252, 201, 188),
        iconSize: 64,
        currentIndex: navigationShell.currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
        onTap: (index) => navigationShell.goBranch(index));
  }
}
