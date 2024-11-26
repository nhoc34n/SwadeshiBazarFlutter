import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isBuyMode = true; // Default to Buy Mode
  String userType = "Consumer"; // User type can be 'Consumer' or 'Farmer'

  // Method to show category message in a toast-like fashion
  void showCategoryMessage(String category) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Selected: $category'),
    ));
  }

  // Method to toggle between Buy and Sell Modes
  void toggleBuySell(bool isBuy) {
    setState(() {
      isBuyMode = isBuy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F9),
      appBar: AppBar(
        title: const Text('Swadeshi Bazar'),
        backgroundColor: const Color(0xFF00B341),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle notification
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Buy/Sell Buttons Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => toggleBuySell(true),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        isBuyMode ? Colors.green : const Color(0xFFE7F6E9)),
                  ),
                  child: Text('Buy Product',
                      style: TextStyle(
                          color: isBuyMode ? Colors.white : Colors.green)),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (userType == "Farmer") {
                      toggleBuySell(false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text("Only farmers can add items to sell")),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        !isBuyMode ? Colors.green : const Color(0xFFE7F6E9)),
                  ),
                  child: Text('Sell Product',
                      style: TextStyle(
                          color: !isBuyMode ? Colors.white : Colors.green)),
                ),
              ],
            ),
          ),
          // Banner Section
          Image.asset('assets/add.jpg', fit: BoxFit.cover),

          // Search Bar Section
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search Product',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          // Grid Layout for Buy/Sell Section
          Expanded(
            child: isBuyMode ? buildBuyGrid() : buildSellGrid(),
          ),
        ],
      ),
    );
  }

  // Build Buy Grid Layout
  Widget buildBuyGrid() {
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(16.0),
      children: [
        buildProductCard('Buy Seeds', 'assets/seed.jpg'),
        buildProductCard('Buy Crops', 'assets/wheat.jpg'),
        buildProductCard('Buy Livestocks', 'assets/livestock.jpg'),
        buildProductCard('Buy Vegetables', 'assets/vegetable.jpg'),
        buildProductCard('Buy Homemade', 'assets/hmade.jpg'),
      ],
    );
  }

  // Build Sell Grid Layout
  Widget buildSellGrid() {
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(16.0),
      children: [
        buildProductCard('Add Seed', 'assets/seed.jpg'),
        buildProductCard('Add Crops', 'assets/wheat.jpg'),
        buildProductCard('Add Livestock', 'assets/livestock.jpg'),
        buildProductCard('Add Vegetables', 'assets/vegetable.jpg'),
        buildProductCard('Add Homemade', 'assets/hmade.jpg'),
      ],
    );
  }

  // Method to build product card in grid
  Widget buildProductCard(String title, String imagePath) {
    return GestureDetector(
      onTap: () => showCategoryMessage(title),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 90, width: 90),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFF6D6D6D), fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
