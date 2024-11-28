import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_symbols_icons/symbols.dart';

List<Widget> makeNavigationDrawerBarChildren(BuildContext context) => [
      NavigationDrawerDestination(
        icon: const Icon(Symbols.home_rounded),
        selectedIcon: const Icon(
          Symbols.home_rounded,
          fill: 1,
        ),
        label: Text(AppLocalizations.of(context)?.navigationDrawer_homeItem ?? '-'),
      ),
      NavigationDrawerDestination(
        icon: const Icon(Symbols.dashboard_rounded),
        selectedIcon: const Icon(
          Symbols.dashboard_rounded,
          fill: 1,
        ),
        label: Text(AppLocalizations.of(context)?.navigationDrawer_productsItem ?? '-'),
      ),
      NavigationDrawerDestination(
        icon: const Icon(Symbols.orders_rounded),
        selectedIcon: const Icon(
          Symbols.orders_rounded,
          fill: 1,
        ),
        label: Text(AppLocalizations.of(context)?.navigationDrawer_ordersItem ?? '-'),
      ),
      NavigationDrawerDestination(
        icon: const Icon(Symbols.support_rounded),
        selectedIcon: const Icon(
          Symbols.support_rounded,
          fill: 1,
        ),
        label: Text(AppLocalizations.of(context)?.navigationDrawer_supportItem ?? '-'),
      ),
    ];
