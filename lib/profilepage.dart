import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/about_us_page.dart';
import 'adminpage.dart';
import 'sessionmanager.dart';

// import 'package:tradepro/screens/about_us_page.dart';
// import 'coming_soon.dart';


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

class profile_appBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: clr1,
      // centerTitle: true,
      title: Text('Account', style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w600, color: clr2),),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_none_outlined),
          color: Color(0xFF616161),
        )
      ],
      elevation: 5,
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}

class profile_body extends StatefulWidget {
  @override
  State<profile_body> createState() => _profile_bodyState();
}

class _profile_bodyState extends State<profile_body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, top: 10),
            child: Text('Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          ),      // account
          Divider(
            thickness: 1.0,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => coming_soon() ));
            },
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
                          Text("History", style: MyTextStyle(),),
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
                        Icon(
                          Icons.flip_camera_android,
                          color: Color(0xFF616161),
                          size: 20,
                        ),
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
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => coming_soon() ));
            },
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
                          Text("Referal Code", style: MyTextStyle(),),
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
                        Icon(
                          Icons.lock_open_outlined,
                          color: Color(0xFF616161),
                          size: 20,
                        ),
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
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => coming_soon() ));
            },
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
                          Text("Profile", style: MyTextStyle(),),
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
                        Icon(
                          Icons.person,
                          color: Color(0xFF616161),
                          size: 20,
                        ),
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
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => coming_soon() ));
            },
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
                          Text("Settings", style: MyTextStyle(),),
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
                        Icon(
                          Icons.settings,
                          color: Color(0xFF616161),
                          size: 20,
                        ),
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
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => coming_soon() ));
            },
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
                          Text("Admin Pass", style: MyTextStyle(),),
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
                        Icon(
                          Icons.square_outlined,
                          color: Color(0xFF616161),
                          size: 20,
                        ),
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
            onTap: () async {
              // exit(0);
              // await SessionManager.clearToken();
              // Navigator.pushReplacementNamed(context, '/login'); // Redirect to Login screen
            },
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
                          Text("Logout", style: MyTextStyle(),),
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
                        Icon(
                          Icons.logout,
                          color: Color(0xFF616161),
                          size: 20,
                        ),
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
            padding: const EdgeInsets.only(left: 14.0, top: 10),
            child: Text('Connect with Us', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          ),
          Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Locate you', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: clr3),),
                    SizedBox(width: 20,),
                    Text('Message us', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: clr3),),
                    SizedBox(width: 20,),
                    Text('Bills', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: clr3),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Expenditure', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: clr3),),
                    SizedBox(width: 20,),
                    Text('Gift Snacks', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: clr3),),
                    SizedBox(width: 20,),
                    Text('Party', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: clr3),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Downloads', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: clr3),)
                  ],
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, top: 10),
            child: Text('Support', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          ),      // support
          Divider(
            thickness: 1.0,
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context, CupertinoPageRoute(builder: (context) => about_us() ));
            },
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
                          Text("Support Portal", style: MyTextStyle(),),
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
                        Icon(
                          Icons.support,
                          color: Color(0xFF616161),
                          size: 20,
                        ),
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
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => about_us() ));
            },
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
                          Text("User Manual", style: MyTextStyle(),),
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
                        Icon(
                          Icons.help_outline_outlined,
                          color: Color(0xFF616161),
                          size: 20,
                        ),
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
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => about_us() ));
            },
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
                          Text("About App", style: MyTextStyle(),),
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
                        Icon(
                          Icons.call,
                          color: Color(0xFF616161),
                          size: 20,
                        ),
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
            padding: const EdgeInsets.only(left: 14.0, top: 10),
            child: Text('Others', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          ),      // others
          Divider(
            thickness: 1.0,
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => coming_soon() ));
            },
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
                          Text("Invite Friends", style: MyTextStyle(),),
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
                        Icon(
                          Icons.person_add_outlined,
                          color: Color(0xFF616161),
                          size: 20,
                        ),
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
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => coming_soon() ));
            },
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
                          Text("Licenses", style: MyTextStyle(),),
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
                        Icon(
                          Icons.document_scanner_outlined,
                          color: Color(0xFF616161),
                          size: 20,
                        ),
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

        ],
      ),
    );
  }
}