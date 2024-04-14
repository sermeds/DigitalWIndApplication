import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

@RoutePage(name: 'HomeRootRouter')
class HomeRootPage extends AutoRouter {
  const HomeRootPage({super.key});
}

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<String> get _dbPath async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String dbPath = path.join(databasesPath, 'demo2.db');

    return dbPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Дети  цветы жизни!")),
        body: Center(child: const Text('F')));
  }
}
