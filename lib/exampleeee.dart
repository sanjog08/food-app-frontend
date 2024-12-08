import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HorizontalListViewPage extends StatefulWidget {
  @override
  _HorizontalListViewPageState createState() => _HorizontalListViewPageState();
}

class _HorizontalListViewPageState extends State<HorizontalListViewPage> {
  late Future<List<String>> futureItems;

  @override
  void initState() {
    super.initState();
    futureItems = fetchItems(); // Fetch data asynchronously
  }

  Future<List<String>> fetchItems() async {
    // Simulate a network request with a delay
    await Future.delayed(Duration(seconds: 2));
    return ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horizontal ListView with FutureBuilder')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Horizontal List:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FutureBuilder<List<String>>(
              future: futureItems,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  List<String> items = snapshot.data!;
                  return SizedBox(
                    height: 120, // Constrain the height for horizontal ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              items[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: Text('No items found.'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HorizontalListViewPage(),
  ));
}
