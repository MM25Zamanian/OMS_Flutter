import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oms/pages/home.dart';
import 'package:oms/pages/orders.dart';
import 'package:oms/pages/products.dart';
import 'package:oms/pages/support.dart';

List<RouteBase> routes = <RouteBase>[
  GoRoute(
    path: '/',
    name: 'Home',
    builder: (BuildContext context, GoRouterState state) {
      return const Home();
    },
  ),
  GoRoute(
    path: '/products',
    name: 'Products',
    builder: (BuildContext context, GoRouterState state) {
      return const Products();
    },
  ),
  GoRoute(
    path: '/orders',
    name: 'Orders',
    builder: (BuildContext context, GoRouterState state) {
      return const Orders();
    },
  ),
  GoRoute(
    path: '/support',
    name: 'Support',
    builder: (BuildContext context, GoRouterState state) {
      return const Support();
    },
  ),
];

final GlobalKey<NavigatorState> routerNavigatorKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  routes: routes,
  navigatorKey: routerNavigatorKey,
);
