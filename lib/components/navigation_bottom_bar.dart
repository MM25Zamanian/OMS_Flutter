import 'package:flutter/material.dart';
import 'package:oms/config/navigation_bottom_bar_destinations.dart';
import 'package:oms/utilities/router.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({super.key, required this.openDrawer, required this.path});

  final void Function() openDrawer;
  final String path;

  @override
  Widget build(BuildContext context) {
    List<NavigationDestination> destinations = makeNavigationBottomBarDestinations(context);

    return NavigationBar(
      destinations: destinations,
      selectedIndex: getIndexByPath(),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      onDestinationSelected: (int index) {
        if (index == 0) {
          openDrawer();
        } else {
          router.go(getPathByIndex(index));
        }
      },
    );
  }

  int getIndexByPath() {
    Map<String, int> items = <String, int>{
      '/products': 1,
      '/': 2,
      '/orders': 3,
      '/support': 4,
    };

    int? index = items[path];

    return index ?? -1;
  }

  String getPathByIndex(int index) {
    Map<int, String> items = <int, String>{
      1: '/products',
      2: '/',
      3: '/orders',
      4: '/support',
    };

    String? route = items[index];

    return route ?? '/';
  }
}
