import 'package:flutter/material.dart';
import 'customWidgets/photoBooth.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mytitle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: Colors.black),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Icon(Icons.account_circle_outlined, color: Colors.black),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          // Horizontal List
          Container(
            height: 150,  // Set a fixed height for the horizontal list container
            color: Colors.grey[200],
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(20),
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    child: Icon(
                      Icons.account_circle_sharp,
                      size: 100,
                    ),
                  ),
                );
              },
            ),
          ),
          // Vertical List below
          Container(
            color: Colors.grey[200],
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(), // Disable scrolling for this internal list
              shrinkWrap: true, // Allow the ListView to occupy only as much space as needed
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Photobooth();
              },
            ),
          ),
        ],
      ),
    );
  }
}