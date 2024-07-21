import 'package:flutter/material.dart';

class HomeMenu {
  String title;
  IconData leadingIcon;

  HomeMenu({
    required this.title,
    required this.leadingIcon,
  });
}

List<HomeMenu> homeMenus = [
  HomeMenu(
    title: 'Dashboard',
    leadingIcon: Icons.home_rounded,
  ),
  HomeMenu(
    title: 'Management',
    leadingIcon: Icons.manage_accounts_rounded,
  ),
  HomeMenu(
    title: 'Employees',
    leadingIcon: Icons.people_rounded,
  ),
  HomeMenu(
    title: 'Settings',
    leadingIcon: Icons.settings_rounded,
  ),
];
