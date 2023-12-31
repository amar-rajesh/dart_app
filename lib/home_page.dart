import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'buying.dart';
import 'sell.dart';
import 'setting.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductSelectionPage()),
                    );
                  },
                  child: const Text("Buy"),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    minimumSize: Size(110, 110),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the selling page when the "Sell" button is pressed.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SellPage()), // Replace with your selling page
                    );
                  },
                  child: Text('Sell'),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    minimumSize: Size(110, 110),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CarouselSlider(
              items: [
                Image.asset('assets/farmer.jpg'),
                Image.asset('assets/farmers.jpg'),
                Image.asset('assets/farmer2.jpg'),
              ],
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Handle "Learn More" button press
            },
            child: Text("Learn More"),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Handle Home button press
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle Notifications button press
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
