import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/app_router.dart';
import 'package:flutter/material.dart';

class NavPanel extends StatelessWidget{

  const NavPanel({super.key, required this.index});

  final int index;

  final List<PageRouteInfo> _routes = const [MainRoute(), ProfileRoute(), Testing(), ShopRoute(), LibraryRoute()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Главная"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
      BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: "Игры и тесты"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Магазин"),
      BottomNavigationBarItem(icon: Icon(Icons.library_books), label: "Библиотека"),
    ],
    
    currentIndex: index,
    selectedItemColor: Colors.amber[800],
    onTap: (index){
      if(index != this.index)
      {
        context.router.replace(_routes[index]);
      }
    },
    );
  }
  
}