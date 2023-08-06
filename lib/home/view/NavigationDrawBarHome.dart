import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawerHome extends StatelessWidget {
  const NavigationDrawerHome({super.key});

  @override
  Widget build(BuildContext context) => Drawer(

    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) => Container(
    padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top
    ),
  );
  Widget buildMenuItems(BuildContext context) => Column(
    children: [
      const DrawerHeader(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/logo.png")
            )
        ), child: null,
      ),
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text("Home"),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.notifications_active_outlined),
        title: const Text("Login"),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.login_outlined),
        title: const Text("Login"),
        onTap: () {},
      ),
    ],
  );

}