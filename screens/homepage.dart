import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 99, 4),
      body: Stack(
        children: [
          // Full background card
          Positioned.fill(
            child: Card(
              elevation: 8,
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'Google Maps',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ),
              ),
            ),
          ),

          // Top buttons: Dashboard and Search
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color.fromARGB(255, 222, 91, 4),
              ),
              onPressed: () {
                // Open drawer or dashboard menu
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: IconButton(
              icon: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 231, 94, 3),
              ),
              onPressed: () {
                // Search functionality
              },
            ),
          ),
        ],
      ),

      // Floating Navigation Bar
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        height: 60,
        width: 340,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavIcon(Icons.home, 0),
            _buildNavIcon(Icons.sports_soccer, 1),
            _buildNavIcon(Icons.feed, 2),
            _buildNavIcon(Icons.chat, 3),
            _buildNavIcon(Icons.person, 4),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        size: 28,
        color:
            _currentIndex == index
                ? const Color.fromARGB(255, 236, 104, 3)
                : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
