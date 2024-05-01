import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/components/mainscaffold.dart';
import 'package:digital_wind_application/pages/subpages/avatar_editor.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        index: 1,
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AvatarEditorPage()));
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: const Text("Редактор персонажа"),
              ),
            ],
          ),
        ));
  }
}
