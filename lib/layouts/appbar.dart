import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:fan_side_drawer/fan_side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogin/main.dart';

TextEditingController user = TextEditingController();
TextEditingController pass = TextEditingController();

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List<DrawerMenuItem> get menuItems => [
        DrawerMenuItem(
            title: 'Home',
            icon: Icons.house_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Account Details',
            icon: Icons.account_circle_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Tickets',
            icon: Icons.support_agent_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Orders',
            icon: Icons.format_list_bulleted_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'App Settings',
            icon: Icons.adb_sharp,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Notifications',
            icon: Icons.alarm_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'subscription Plans',
            icon: Icons.question_answer_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Logout',
            icon: Icons.logout_outlined,
            iconSize: 15,
            onMenuTapped: () {
              DelightToastBar(
                autoDismiss: true,
                builder: (context) => const ToastCard(
                  leading: Icon(
                    Icons.check_circle,
                    color: Color.fromARGB(225, 246, 177, 122),
                    size: 28,
                  ),
                  title: Text(
                    "Logout Successful",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ).show(context);
              pass.clear();
              user.clear();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            }),
      ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 230,
      backgroundColor: Colors.white,
      child: FanSideDrawer(
        selectedColor: const Color.fromARGB(225, 246, 177, 122),
        selectedItemBackgroundColor: const Color.fromARGB(225, 45, 50, 80),
        drawerType: DrawerType.pipe,
        drawerItemsWidth: 200,
        menuItems: menuItems,
      ),
    );
  }
}
