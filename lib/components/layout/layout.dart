import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onaka_diary/components/footer/footer.dart';
import 'package:onaka_diary/components/header/header.dart';

class Layout extends StatefulWidget {
  const Layout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    var navigationShell = widget.navigationShell;

    return Scaffold(
      appBar: const Header(),
      body: Container(
        color: Colors.white,
        child: navigationShell,
      ),
      bottomNavigationBar: Footer(
        navigationShell: navigationShell,
      ),
    );
  }
}
