import 'package:template/pages/Menu.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'Menu': (BuildContext context) => MenuPage(),
  };
}
