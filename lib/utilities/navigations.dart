import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

const Map<String, Map<String, Icon>> icons = {
  'menu': {
    'normal': Icon(Symbols.menu_rounded),
  },
};

enum NavIcons {
  menu,
  products,
}

const x =ThemeMode.dark;