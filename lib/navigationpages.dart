import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/profilepage.dart';
import 'package:food_app/seeall.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/food_items_model.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  late Future<List<FoodItem>> futureFoodItems;

  // @override
  // void initState() {
  //   super.initState();
  //   futureFoodItems = ApiService().fetchFoodItems(); // Call API to get food items
  // }


  late Future<List<String>> futureItems;

  @override
  void initState() {
    super.initState();
    futureItems = fetchItems();
  }

  final List<String> imageUrls = [
    'images/Image-1.png',
    'images/Image-2.png',
    'images/Image-3.png',
    'images/Image-1.png',
    'images/Image-2.png',
  ];

  Future<List<String>> fetchItems() async {
    // Simulating network call
    await Future.delayed(Duration(seconds: 2));
    return ['Cheese Burger', 'Chicken Wrap', 'Sandwich', 'Momos', 'Sandwich'];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        // padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        padding: EdgeInsets.only(left: 10, right: 10, top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Row
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFA500),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage('images/home.png'),
                          height: 25,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'IET DAVV, A3-Boys Hostel, Indore',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Horizontal ListView
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4, // Example item count
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width - 35,
                      color: Color(0xFFFFA500),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 30),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Get your 30% daily',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'discount now!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Order now!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Image(
                            image: AssetImage('images/offer-image.png'),
                            height: 170,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              // horizontal scrollview food-items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Today\'s special 😍' , style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => SeeAllPage()),);
                    },
                    child: Text('See all', style: TextStyle(color: Color(0xFFFFA500), fontSize: 20, fontWeight: FontWeight.w500),)
                  ),
                ],
              ),
              SizedBox(height: 10,),
              FutureBuilder<List<String>>(
                future: futureItems,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFA500)),
                        ),);
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    List<String> items = snapshot.data!;
                    return SizedBox(
                      height: 180, // Constrain the height for horizontal ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 280,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFA500),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                // Image at the top
                                Expanded(
                                  child: Image.asset(
                                    imageUrls[index],
                                    fit: BoxFit.cover, // This will make the image cover the available space
                                    width: double.infinity, // Make sure the image takes up full width
                                  ),
                                ),
                                // Product name below the image
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0), // Optional padding between the image and name
                                  child: Text(
                                    items[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center, // Center the product name
                                  ),
                                ),
                              ],
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
              SizedBox(height: 20),
              // horizontal scrollview food-items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular items 🔥🔥', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                  InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => SeeAllPage()),);
                      },
                      child: Text('See all', style: TextStyle(color: Color(0xFFFFA500), fontSize: 20, fontWeight: FontWeight.w500),)
                  ),
                ],
              ),
              SizedBox(height: 10,),
              FutureBuilder<List<String>>(
                future: futureItems,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFA500)),
                        ),);
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    List<String> items = snapshot.data!;
                    return SizedBox(
                      height: 240, // Constrain the height for horizontal ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 200,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFA500),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                // Image at the top
                                Expanded(
                                  child: Image.asset(
                                    imageUrls[index],
                                    fit: BoxFit.cover, // This will make the image cover the available space
                                    width: double.infinity, // Make sure the image takes up full width
                                  ),
                                ),
                                // Product name below the image
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0), // Optional padding between the image and name
                                  child: Text(
                                    items[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center, // Center the product name
                                  ),
                                ),
                              ],
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
              SizedBox(height: 20),
              // horizontal scrollview food-items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Explore food 🔎' , style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                  InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => SeeAllPage()),);
                      },
                      child: Text('See all', style: TextStyle(color: Color(0xFFFFA500), fontSize: 20, fontWeight: FontWeight.w500),)
                  ),
                ],
              ),
              SizedBox(height: 10,),
              FutureBuilder<List<String>>(
                future: futureItems,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFA500)),
                      ),);
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    List<String> items = snapshot.data!;
                    return SizedBox(
                      height: 180, // Constrain the height for horizontal ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 280,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFA500),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                // Image at the top
                                Expanded(
                                  child: Image.asset(
                                    imageUrls[index],
                                    fit: BoxFit.cover, // This will make the image cover the available space
                                    width: double.infinity, // Make sure the image takes up full width
                                  ),
                                ),
                                // Product name below the image
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0), // Optional padding between the image and name
                                  child: Text(
                                    items[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center, // Center the product name
                                  ),
                                ),
                              ],
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

class ApiService {
  final String apiUrl = 'https://food-app-backend-bice.vercel.app/all-food-items'; // Replace with your API URL

  Future<List<FoodItem>> fetchFoodItems() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((item) => FoodItem.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load food items');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}




class RestaurantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Restaurants Page Content'));
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Search Page Content'));
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Favorites Page Content'));
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return profile_body();
  }
}
