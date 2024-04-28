import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/components/navpanel.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ShopPage extends StatefulWidget{

  const ShopPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ShopPageState();
  }

}

class _ShopPageState extends State<ShopPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Магазин")),
      bottomNavigationBar: const NavPanel(index: 3)
    );
  }

}