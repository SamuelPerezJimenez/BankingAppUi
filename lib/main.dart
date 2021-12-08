import 'package:flutter/material.dart';
import 'package:banking_app_ui/pages/transfers.dart';

//ui: https://www.instagram.com/p/CN2YpJ0g_Bv/

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Banking App',
        home: Transfers());
  }
}
