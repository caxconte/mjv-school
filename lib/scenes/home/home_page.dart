import 'package:flutter/material.dart';

import '../../components/app_bar_component.dart';
import 'tabs/to_do_tab.dart';
import 'tabs/profile_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int selectedTab;

  final List<BottomNavigationBarItem> _tabs = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), label: 'Perfil'),
  ];

  final List<Widget> _content = [
    const ToDoTab(),
    const ProfileTab(),
  ];

  void handleTab(int tabIdx) {
    setState(() {
      selectedTab = tabIdx;
    });
  }

  @override
  void initState() {
    selectedTab = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(),
      body: _content.elementAt(selectedTab),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        items: _tabs,
        onTap: handleTab,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          handleTab(1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
