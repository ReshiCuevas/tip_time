import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_time/tip_provider.dart';
import 'package:tip_time/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 47, 206, 60)),
      ),
      home: ChangeNotifierProvider<TipTimeProvider>(
        create: (context) => TipTimeProvider(),
        child: HomePage(),
      ),
    );
  }
}
