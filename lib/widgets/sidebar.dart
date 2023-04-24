import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Kalpesh Mahale"),
            accountEmail: Text("mahalekalpesh1012@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("assets/images/user.jpg"),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text("Log-Out"),
            onTap: () {
              Navigator.pushNamed(context, "login");
            },
          )
        ],
      ),
    );
  }
}
