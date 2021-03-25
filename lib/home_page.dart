import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:ietvit_app/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User users = FirebaseAuth.instance.currentUser;
  Future<void> signOut() async {
    await Firebase.initializeApp();
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xFF28B9E4));
    return Scaffold(
      appBar: new AppBar(
        actions: [
          new IconButton(
            icon: new SvgPicture.asset("assets/icons/ic_admin_nav.svg"),
            iconSize: 15,
            onPressed: () {},
          )
        ],
        backgroundColor: Color(0xFF28B9E4),
        title: new Text(
          "IET-VIT",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontFamily: "roboto_medium"),
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(1, 0),
                      colors: [Color(0xFF57B7D7), Color(0xFF0B2751)])),
              accountName: new Text(
                "Test Account",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "roboto_medium"),
              ),
              accountEmail: new Text(
                users.email,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white38,
                    fontFamily: "roboto_medium"),
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.blue[700],
                child: new Text(
                  "TA",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20),
            ),
            new GestureDetector(
              child: new Row(
                children: [
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  new Icon(
                    Icons.home,
                    size: 35,
                    color: Colors.grey[700],
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  new Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: "poppins_semibold"),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()));
              },
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 35),
            ),
            new GestureDetector(
              child: new Row(
                children: [
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  new Icon(
                    Icons.view_quilt,
                    size: 35,
                    color: Colors.grey[700],
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  new Text(
                    "Dashboard",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: "poppins_semibold"),
                  )
                ],
              ),
              onTap: () {},
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20),
            ),
            new Divider(
              thickness: 1,
              color: Colors.grey[400],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: new Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontFamily: "roboto_medium"),
                  ),
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20),
            ),
            new GestureDetector(
              child: new Row(
                children: [
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  new Icon(
                    Icons.emoji_emotions,
                    size: 35,
                    color: Colors.grey[700],
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  new Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: "poppins_semibold"),
                  )
                ],
              ),
              onTap: () {},
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20),
            ),
            new GestureDetector(
              child: new Row(
                children: [
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  new Image.asset(
                    "assets/images/hackoff_logo.png",
                    width: 35,
                    height: 50,
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  new Text(
                    "HackOff 3.0",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: "poppins_semibold"),
                  )
                ],
              ),
              onTap: () {},
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20),
            ),
            new GestureDetector(
              child: new Row(
                children: [
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  new Icon(
                    Icons.keyboard_return,
                    size: 35,
                    color: Colors.grey[700],
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  new Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: "poppins_semibold"),
                  )
                ],
              ),
              onTap: signOut,
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 160),
            ),
            new Column(
              children: [
                new Text("Version 1.2",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0B2751),
                        fontFamily: "poppins_semibold")),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text(
                      "Made with ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: "pacifico"),
                    ),
                    new SvgPicture.asset(
                      "assets/icons/love.svg",
                      color: Colors.red,
                    ),
                    new Text(
                      " by ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: "pacifico"),
                    ),
                    new Image.asset(
                      "assets/images/iet_logo_blue.png",
                      width: 50,
                      height: 50,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: new Container(
        width: 70,
        height: 70,
        child: new FittedBox(
          child: new FloatingActionButton(
            focusColor: Color(0xFF28B9E4),
            onPressed: () {},
            child: new Padding(
              padding: const EdgeInsets.all(15),
              child: new Image.asset("assets/images/qr_code.png"),
            ),
          ),
        ),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: [
            new Padding(
              padding: const EdgeInsets.only(top: 20),
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
                new Text(
                  "Upcoming Meetings",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B2751),
                      fontFamily: "acme"),
                )
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20),
            ),
            new SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Card(
                      shadowColor: Colors.grey,
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: new Column(
                        children: [
                          new Padding(
                              padding: const EdgeInsets.all(20),
                              child: new Text(
                                "No meetings upcoming",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue[800],
                                    fontFamily: "poppins_semibold"),
                              )),
                        ],
                      ))
                ],
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 60),
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
                new Text(
                  "Tasks to be done",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B2751),
                      fontFamily: "acme"),
                )
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20),
            ),
            new SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Card(
                      shadowColor: Colors.grey,
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: new Column(
                        children: [
                          new Padding(
                              padding: const EdgeInsets.all(20),
                              child: new Text(
                                "All Tasks Completed",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue[800],
                                    fontFamily: "poppins_semibold"),
                              )),
                        ],
                      ))
                ],
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 60),
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
                new Text(
                  "Upcoming Events & Workshops",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B2751),
                      fontFamily: "acme"),
                )
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20),
            ),
            new SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Card(
                      shadowColor: Colors.grey,
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: new Column(
                        children: [
                          new Padding(
                              padding: const EdgeInsets.all(20),
                              child: new Row(
                                children: [
                                  new Image.asset(
                                    "assets/images/event.png",
                                    width: 100,
                                    height: 100,
                                  ),
                                  new Column(
                                    children: [
                                      new Text(
                                        "Date to be announced",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.red,
                                            fontFamily: "poppins_semibold"),
                                      ),
                                      new Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                      ),
                                      new Text(
                                        "This is a SAMPLE Event",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blue[800],
                                            fontFamily: "poppins_semibold"),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
