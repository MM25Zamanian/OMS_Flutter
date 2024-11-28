import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.navigationDrawer_supportItem ?? '-'),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () {
            context.goNamed('Home');
          },
          child: const Text('Go To Home'),
        ),
      ),
    );
  }
}
