import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_symbols_icons/symbols.dart';

List<NavigationDestination> makeNavigationBottomBarDestinations(BuildContext context) => [
      // Menu Button
      NavigationDestination(
        icon: const Icon(Symbols.menu_rounded),
        label: AppLocalizations.of(context)?.navigationBar_menuItem ?? '-',
        tooltip: '',
      ),
      // Products
      NavigationDestination(
        icon: const Icon(Symbols.dashboard_rounded),
        selectedIcon: const Icon(
          Symbols.dashboard_rounded,
          fill: 1,
        ),
        label: AppLocalizations.of(context)?.navigationBar_productsItem ?? '-',
        tooltip: '',
      ),
      // Home
      NavigationDestination(
        icon: const Icon(Symbols.home_rounded),
        selectedIcon: const Icon(
          Symbols.home_rounded,
          fill: 1,
        ),
        label: AppLocalizations.of(context)?.navigationBar_homeItem ?? '-',
        tooltip: '',
      ),
      // Orders
      NavigationDestination(
        icon: const Icon(Symbols.orders_rounded),
        selectedIcon: const Icon(
          Symbols.orders_rounded,
          fill: 1,
        ),
        label: AppLocalizations.of(context)?.navigationBar_ordersItem ?? '-',
        tooltip: '',
      ),
      // Support
      NavigationDestination(
        icon: const Icon(Symbols.support_rounded),
        selectedIcon: const Icon(
          Symbols.support_rounded,
          fill: 1,
        ),
        label: AppLocalizations.of(context)?.navigationBar_supportItem ?? '-',
        tooltip: '',
      ),
    ];
