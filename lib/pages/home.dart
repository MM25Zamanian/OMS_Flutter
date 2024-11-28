import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: false,
      //   backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      //   surfaceTintColor: Colors.transparent,
      //   title: Text(AppLocalizations.of(context)?.navigationDrawer_homeItem ?? '-'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints.expand(height: 56),
              child: CarouselView(
                itemExtent: 158,
                padding: const EdgeInsets.all(8),
                shrinkExtent: 158,
                itemSnapping: true,
                shape: ShapeBorder,
                children: [
                  FilledButton(onPressed: () {}, child: const Text('تمام محصولات')),
                  TextButton(onPressed: () {}, child: const Text('تمام محصولات')),
                  TextButton(onPressed: () {}, child: const Text('تمام محصولات')),
                  TextButton(onPressed: () {}, child: const Text('تمام محصولات')),
                  TextButton(onPressed: () {}, child: const Text('تمام محصولات')),
                  TextButton(onPressed: () {}, child: const Text('تمام محصولات')),
                  TextButton(onPressed: () {}, child: const Text('تمام محصولات')),
                ],
              ),
            ),
            Text(
              'سلام سلام',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            createCarousel(context),
            ...List<Widget>.generate(50, (index) => Text('متن آزمایشی $index'))
          ],
        ),
      ),
    );
  }

  Widget createCarousel(BuildContext context) {
    double viewportWidth = MediaQuery.of(context).size.width;
    Size carouselSize = Size(
      max(
        viewportWidth * 20 / 60,
        300,
      ),
      max(
        viewportWidth * 9 / 60,
        135,
      ),
    );

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: carouselSize.height),
        child: CarouselView(
          itemExtent: carouselSize.width,
          itemSnapping: true,
          shrinkExtent: 10,
          children: List<Widget>.generate(7, (int index) {
            List<String> images = [
              '29f1578e470be2689fdef2ea859edefa513a0fd1_1731743543.gif',
              '90708c6cd74cc6baaf2512ad52fb9232ab924905_1731743404.jpg',
              'a798cf61d846dc1d7e1c7173e55f5759544d0cd6_1731743797.jpg',
              'ace4cad4849847140fddd8eae461ea535b445351_1731743725.jpg',
              'aef91c53edbdb3a08f6baff312ae3a90319201ee_1731743297.jpg',
              'c8234be8472975e696a5da5dc8c36cd768ef7ea4_1731743662.jpg',
              'cdf17c8e764d04eb4770bc99ea77f3359875013b_1731913320.jpg',
            ];

            return UnconstrainedBox(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                'http://localhost:8082/${images[index]}',
                fit: BoxFit.contain,
                alignment: Alignment.center,
                width: carouselSize.width,
              ),
            );
          }),
        ),
      ),
    );
  }
}
