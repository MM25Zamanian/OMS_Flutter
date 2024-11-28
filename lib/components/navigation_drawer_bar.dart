import 'package:flutter/material.dart';
import 'package:oms/config/navigation_drawer_bar_children.dart';
import 'package:oms/utilities/router.dart';

class NavigationDrawerBar extends StatelessWidget {
  const NavigationDrawerBar({super.key, required this.path, required this.isMobile});

  final String path;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = makeNavigationDrawerBarChildren(context);

    return NavigationDrawer(
      selectedIndex: getIndexByPath(),
      backgroundColor:
          isMobile ? Theme.of(context).colorScheme.surfaceContainerLowest : Theme.of(context).colorScheme.surfaceContainerLow,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 28, 16),
          child: Row(
            children: [
              Image.asset(
                'icons/web/icon-512.png',
                width: 24,
                height: 24,
                isAntiAlias: true,
                fit: BoxFit.contain,
                alignment: Alignment.center,
                gaplessPlayback: true,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(
                  'سیستم مدیریت سفارشات',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
        ...children,
      ],
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
