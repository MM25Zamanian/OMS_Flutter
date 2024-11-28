import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_symbols_icons/symbols.dart';

List<NavigationRailDestination> makeNavigationRailBarDestinations(BuildContext context) => [
      NavigationRailDestination(
        icon: const Icon(Symbols.home_rounded),
        selectedIcon: const Icon(
          Symbols.home_rounded,
          fill: 1,
        ),
        label: Text(AppLocalizations.of(context)?.navigationBar_homeItem ?? '-'),
      ),
      NavigationRailDestination(
        icon: const Icon(Symbols.dashboard_rounded),
        selectedIcon: const Icon(
          Symbols.dashboard_rounded,
          fill: 1,
        ),
        label: Text(AppLocalizations.of(context)?.navigationBar_productsItem ?? '-'),
      ),
      NavigationRailDestination(
        icon: const Icon(Symbols.orders_rounded),
        selectedIcon: const Icon(
          Symbols.orders_rounded,
          fill: 1,
        ),
        label: Text(AppLocalizations.of(context)?.navigationBar_ordersItem ?? '-'),
      ),
      NavigationRailDestination(
        icon: const Icon(Symbols.support_rounded),
        selectedIcon: const Icon(
          Symbols.support_rounded,
          fill: 1,
        ),
        label: Text(AppLocalizations.of(context)?.navigationBar_supportItem ?? '-'),
      ),
    ];
