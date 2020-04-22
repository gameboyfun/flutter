import 'package:flutter/material.dart';

class Navigation {
  String title;
  IconData icon;

  Navigation({this.icon,this.title});
}
List<Navigation> navigationItems = [
  Navigation(title: 'Home',icon: Icons.home),
  Navigation(title: 'My Request',icon: Icons.assignment),
  Navigation(title: 'Logout',icon: Icons.exit_to_app)
];