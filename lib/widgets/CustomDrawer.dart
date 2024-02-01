
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/nav_items_strings.dart';
import 'logo.dart';
import '../pages/home_page.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Logo(
                logoText: "Sections",
                onTap: () {},
              ),
            ),
            for (int i = 0; i < navItemsStrings.length; i++)
              ListTile(
                title: Text(navItemsStrings[i]),
                onTap: () {
                  context.findAncestorStateOfType<HomePageState>()?.scrollToIndex(i);
                },
              ),
      
          ],
        ),
      ),
    );
  }
}
