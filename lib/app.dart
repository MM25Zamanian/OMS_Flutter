import 'package:flutter/material.dart';
import 'package:oms/components/app_scaffold.dart';
import 'package:oms/utilities/theme.dart';
import 'package:oms/utilities/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Localization
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale("fa"),
      // General
      themeMode: themeMode,
      theme: ThemeData(
        fontFamily: 'Vazirmatn',
        useMaterial3: true,
        colorScheme: MaterialTheme.lightScheme(),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
            TargetPlatform.values,
            value: (dynamic _) => const FadeUpwardsPageTransitionsBuilder(), //applying old animation
          ),
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Vazirmatn',
        useMaterial3: true,
        colorScheme: MaterialTheme.darkScheme(),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      builder: (context, child) {
        if (child == null) {
          throw 'Child not exists';
        }

        return AppScaffold(child: child);
      },
    );
  }
}
