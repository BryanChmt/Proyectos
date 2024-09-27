import 'package:flutter/material.dart';
import 'package:kripto_tukan/Pages/login_page.dart';
import 'package:kripto_tukan/Pages/register_page.dart';
import 'Pages/home_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'CryptoTukan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        unselectedWidgetColor: Colors.grey
      ),
      home: Scaffold(
        body: HomePage()
      ),
    );
  }
}