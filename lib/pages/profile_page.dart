import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/components/navpanel.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatefulWidget{

  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }

}

class _ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Профиль")),
      bottomNavigationBar: const NavPanel(index: 1)
    );
  }

}