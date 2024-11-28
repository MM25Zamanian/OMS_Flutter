import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:oms/config/navigation_rail_bar_destinations.dart';
import 'package:oms/utilities/router.dart';

class NavigationRailBar extends StatelessWidget {
  const NavigationRailBar({super.key, required this.openDrawer, required this.path});

  final void Function() openDrawer;
  final String path;

  @override
  Widget build(BuildContext context) {
    List<NavigationRailDestination> destinations = makeNavigationRailBarDestinations(context);

    return NavigationRail(
      selectedIndex: getIndexByPath(),
      destinations: destinations,
      groupAlignment: 0,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      leading: IconButton(onPressed: openDrawer, icon: const Icon(Symbols.menu_rounded)),
      labelType: NavigationRailLabelType.selected,
      onDestinationSelected: (int index) {
        router.go(getPathByIndex(index));
      },
    );
  }

  int getIndexByPath() {
    Map<String, int> items = <String, int>{
      '/': 0,
      '/products': 1,
      '/orders': 2,
      '/support': 3,
    };

    int? index = items[path];

    return index ?? -1;
  }

  String getPathByIndex(int index) {
    Map<int, String> items = <int, String>{
      0: '/',
      1: '/products',
      2: '/orders',
      3: '/support',
    };

    String? route = items[index];

    return route ?? '/';
  }
}
