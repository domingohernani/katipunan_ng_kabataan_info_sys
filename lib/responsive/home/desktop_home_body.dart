import 'package:flutter/material.dart';

class DesktopHomeBody extends StatefulWidget {
  const DesktopHomeBody({super.key});

  @override
  _DesktopHomeBodyState createState() => _DesktopHomeBodyState();
}

class _DesktopHomeBodyState extends State<DesktopHomeBody> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text("Home Content")), // Home page content
    Center(child: Text("Search Content")), // Search page content
    Center(child: Text("Settings Content")), // Settings page content
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          NavigationRail(
            leading: Image.asset(
              "lib/assets/logo_transparent.png",
              height: 60,
            ),
            selectedIndex: _selectedIndex, // Track the selected item
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all, // Shows labels always
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                selectedIcon: Icon(Icons.home), // Same icon for selected state
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.search),
                selectedIcon:
                    Icon(Icons.search), // Same icon for selected state
                label: Text('Search'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                selectedIcon:
                    Icon(Icons.settings), // Same icon for selected state
                label: Text('Settings'),
              ),
            ],
          ),
          // Main Content
          Expanded(
            child: _pages[
                _selectedIndex], // Display content based on the selected index
          ),
        ],
      ),
    );
  }
}
