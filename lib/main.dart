import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/home_screen.dart';

void main() {
  runApp(pokedex());
}
class pokedex extends StatelessWidget {
  const pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homescreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
