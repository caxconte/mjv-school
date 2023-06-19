import 'package:flutter/material.dart';
import '../../components/app_bar_component.dart';
import '../home/tabs/profile_tab.dart';
import '../home/tabs/to_do_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State createState() => _HomePage();
}

// ignore: unused_element
class _HomePage extends State<HomePage> {
  late int selectedTab;

  void handleTabs(int tabIndex) {
    setState(() {
      selectedTab = tabIndex;
    });
  }

  @override
  void initState() {
    selectedTab = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> _tabs = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Profile',
      ),
    ];

    final List<Widget> _content = [
      const ToDoTab(
        initialValue: 1,
      ),
      const ProfileTab(),
    ];

    return Scaffold(
      appBar: const AppBarComponent(),
      body: _content.elementAt(selectedTab),
      bottomNavigationBar: BottomNavigationBar(
        onTap: handleTabs,
        currentIndex: selectedTab,
        items: _tabs,
      ),
    );
  }
}
