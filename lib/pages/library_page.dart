import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/components/mainscaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LibraryPage extends StatefulWidget{

  const LibraryPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LibraryPageState();
  }

}

class _LibraryPageState extends State<LibraryPage>{
  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      index: 4,
    );
  }

}