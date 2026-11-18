import 'package:flutter/material.dart';

import 'package:milestone/utils/utils.dart';

class ShellController extends StatelessWidget {
  const ShellController({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_filled),
            label: context.l10n.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.menu_book_outlined),
            label: context.l10n.programs,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bar_chart),
            label: context.l10n.myProgress,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.more_vert),
            label: context.l10n.more,
          ),
        ],
      ),
    );
  }
}
