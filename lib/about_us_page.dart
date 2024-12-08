import 'package:flutter/material.dart';

const Color clr1 = Color(0xFFEEEEEE);
const Color clr2 = Color(0xFF616161);
const Color clr3 = Color(0xFF2196F3);

class MyTextStyle extends TextStyle {
  final Color color;
  final FontWeight fontWeight;
  final double size;

  const MyTextStyle({
    this.color = clr2,
    this.fontWeight = FontWeight.w400,
    this.size = 14,
  })  : super(
    color: color,
    fontWeight: fontWeight,
    fontSize: size,
  );
}

class about_us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Our App', style: TextStyle(color: clr2),),
          backgroundColor: clr1,
          iconTheme: IconThemeData(
            color: clr2,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 10),
              child: Text('Food App Task', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            ),      // account
            Divider(
              thickness: 1.0,
            ),
            InkWell(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sanjog Singh Bhatia", style: MyTextStyle(),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Frontend", style: MyTextStyle(),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.0,
            ),
            InkWell(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sanjog Singh Bhatia", style: MyTextStyle(),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Backend", style: MyTextStyle(),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.0,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Color(0xFFF0F4C3),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Presenting my APP: I am Sanjog, made this mobile application.\n"
                        "Robust user signup and login system ensuring security.\n"
                        "Fetch and manage data from the backend effortlessly, available only after successful user authentication.",
                    // "Presenting our stellar team: Sanjog, Arvind, Abhas, Bhavya, and Harshit - united to drive innovation in our group project.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: clr2),),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Color(0xFFF0F4C3),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "All the code is also available at my githut repository.\n"
                        "https://github.com/sanjog08/food-app-backend\n"
                        "https://github.com/sanjog08/food-app-frontend",
                    // "Presenting our stellar team: Sanjog, Arvind, Abhas, Bhavya, and Harshit - united to drive innovation in our group project.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: clr2),),
                ),
              ),
            ),
          ],
        )
    );
  }

}