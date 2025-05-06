import 'package:flutter/material.dart';
import 'package:onaka_diary/constants/app.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 245, 237),
        title: const Text(AppConstants.appName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
  }
}
