import 'package:flutter/material.dart';
import 'navigationpages.dart'; // Make sure this import is correct

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Initial index of the bottom navigation bar
  int _selectedIndex = 0;

  // Function to change the selected tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of pages to display based on the selected tab
  final List<Widget> _pages = [
    DiscoverPage(),     // Display DiscoverPage widget
    RestaurantPage(),   // Display RestaurantPage widget
    SearchPage(),       // Display SearchPage widget
    FavoritesPage(),    // Display FavoritesPage widget
    ProfilePage(),      // Display ProfilePage widget
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black, // Set the background color of the BottomNavBar
        selectedItemColor: Color(0xFFFF8C00), // Set the color of the selected icon
        unselectedItemColor: Color(0xFFFFA500), // Set the color of unselected icons
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Restaurants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
