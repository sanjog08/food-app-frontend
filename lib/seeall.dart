import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/food_items_model.dart';

class SeeAllPage extends StatefulWidget {
  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  late Future<List<FoodItem>> futureFoodItems;

  @override
  void initState() {
    super.initState();
    futureFoodItems = ApiService().fetchFoodItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Food Items'),
        backgroundColor: Color(0xFFFFA500),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<FoodItem>>(
          future: futureFoodItems,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFA500)),
                  ),);
            } else if (snapshot.hasError) {
              // Improved error handling and logging
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error: ${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          futureFoodItems = ApiService().fetchFoodItems();
                        });
                      },
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Center(child: Text('No food items found'));
              } else {
                List<FoodItem> foodItems = snapshot.data!;
                return ListView.builder(
                  itemCount: foodItems.length,
                  itemBuilder: (context, index) {
                    FoodItem foodItem = foodItems[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Icon(Icons.fastfood, color: Colors.orange),
                        title: Text(foodItem.name),
                        subtitle: Text('Category: ${foodItem.category}'),
                        trailing: Text('₹${foodItem.price.toStringAsFixed(2)}'),
                      ),
                    );
                  },
                );
              }
            } else {
              return Center(child: Text('Unexpected error occurred'));
            }
          },
        ),
      ),
    );
  }
}

class ApiService {
  final String apiUrl = 'https://food-app-backend-bice.vercel.app/all-food-items';

  Future<List<FoodItem>> fetchFoodItems() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        // Log parsed data for debugging
        print('Parsed data: $data');

        // Map JSON data to FoodItem list
        return data.map((item) => FoodItem.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load food items (Status code: ${response.statusCode})');
      }
    } catch (e) {
      print('Error in fetchFoodItems: $e');
      throw Exception('Network error: $e');
    }
  }
}
