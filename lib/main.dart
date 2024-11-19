import 'package:calculator/board_screen.dart';
import 'package:calculator/startgamescreen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyCal());
}

class MyCal extends StatelessWidget {
  const MyCal({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      routes: {
        BoardScreen.routeName :(context)=>BoardScreen(),
        StartScreen.routeName:(context)=>StartScreen(),

        }
        );
    }
}