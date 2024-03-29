import 'package:flutter/material.dart';
import 'layouts/appbar.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'page/view_barang.dart';
import 'page/view_profile.dart';
import 'page/view_inventori.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State {
  int selectedIndex = 1;

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List screens = [const InventoriPage(), const Page2(), const ProfilePage()];

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 250, 238, 209)),
        title: const Text(
          'Jejakami Inventori',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 96, 114, 116),
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: MoltenBottomNavigationBar(
        domeHeight: 18,
        barHeight: 50,
        barColor: const Color.fromARGB(255, 96, 114, 116),
        domeCircleColor: const Color.fromARGB(255, 250, 238, 209),
        selectedIndex: selectedIndex,
        onTabChange: (clickedIndex) {
          setState(() {
            selectedIndex = clickedIndex;
          });
        },
        tabs: [
          MoltenTab(
              icon: const Icon(Icons.explore),
              unselectedColor: const Color.fromARGB(255, 241, 231, 223),
              selectedColor: Colors.black),
          MoltenTab(
              icon: const Icon(Icons.home),
              unselectedColor: const Color.fromARGB(255, 241, 231, 223),
              selectedColor: Colors.black),
          MoltenTab(
              icon: const Icon(Icons.person),
              unselectedColor: const Color.fromARGB(255, 241, 231, 223),
              selectedColor: Colors.black),
        ],
      ),
      body: Center(
        child: screens.elementAt(selectedIndex),
      ),
    );
  }
}
