import 'package:digital_wind_application/components/navpanel.dart';
import 'package:digital_wind_application/pages/subpages/settings.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget{

  const MainScaffold({super.key, required this.index, this.body});

  final int index;

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Фин. грамотный ребенок'), actions: [IconButton(onPressed: (){gotoSettings(context);}, icon: const Icon(Icons.settings))]),
      bottomNavigationBar: NavPanel(index: index),
      body: body,
    );
  }
  
}