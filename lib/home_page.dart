import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:ietvit_app/main.dart';
import 'package:ietvit_app/peers_page.dart';
import 'package:ietvit_app/profile.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ietvit_app/entities/User.dart' as entity_user;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final User user = FirebaseAuth.instance.currentUser;
  entity_user.User currentUser;

  @override
  void initState() {
    getCurrentUserData();
    super.initState();
  }

  Future<void> getCurrentUserData() async {
    final databaseReference = FirebaseDatabase.instance.reference().child('Users/').child(user.uid);
    DataSnapshot dataSnapshot = await databaseReference.once();
    if (dataSnapshot.value != null) {
      setState(() {
        currentUser = entity_user.createUser(dataSnapshot.value);
      });
    }
  }

  Future<void> signOut() async {
    await Firebase.initializeApp();
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => MainPage()));
  }

  createAlertDialog(BuildContext context, String qr_data) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Your QR Code",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22, color: Color(0xFF0B2751), fontFamily: "acme"),
            ),
            content: new Container(
              alignment: Alignment.center,
              width: 180,
              height: 180,
              child: new QrImage(
                data: qr_data,
                size: 180,
                version: QrVersions.auto,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    FlutterStatusbarcolor.setStatusBarColor(Color(0xFF2594C2));
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
      drawer: currentUser == null ? Center(child: new CircularProgressIndicator()) : new Drawer(
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(1, 0),
                      colors: [Color(0xFF57B7D7), Color(0xFF0B2751)])),
              accountName: new Text(
                currentUser.Name,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "oneplus_slate"),
              ),
              accountEmail: new Text(
                user.email,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white38,
                    fontFamily: "roboto_medium"),
              ),
              currentAccountPicture:
              currentUser.Profile.isEmpty || currentUser.Profile == null
                  ? new CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile_image.jpg"),
              ) : new CircleAvatar(
                backgroundImage: new NetworkImage(currentUser.Profile),
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
                    size: 28,
                    color: Colors.grey[700],
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  new Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xDE000000),
                        fontFamily: "roboto_medium"),
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
              padding: const EdgeInsets.only(top: 20),
            ),
            new GestureDetector(
              child: new Row(
                children: [
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  new SvgPicture.asset(
                    "assets/icons/ic_dashboard_nav.svg",
                    color: Colors.black45,
                    height: 28,
                    width: 28,
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  new Text(
                    "Dashboard",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xDE000000),
                        fontFamily: "roboto_medium"),
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
                  new SvgPicture.asset(
                    "assets/icons/ic_peer_nav.svg",
                    color: Colors.black45,
                    height: 28,
                    width: 28,
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  new Text(
                    "Peers",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xDE000000),
                        fontFamily: "roboto_medium"),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PeerPage()));
              },
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 15),
            ),
            new Divider(
              thickness: 1,
              color: Colors.grey[400],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 10),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: new Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0x8a000000),
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
                    size: 28,
                    color: Colors.grey[700],
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  new Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xDE000000),
                        fontFamily: "roboto_medium"),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Profile(currentUser: currentUser)));
              },
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
                    width: 28,
                    height: 28,
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  new Text(
                    "HackOff 3.0",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xDE000000),
                        fontFamily: "roboto_medium"),
                  )
                ],
              ),
              onTap: () {
                launch("https://www.hackoff.tech");
              },
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
                    size: 28,
                    color: Colors.grey[700],
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  new Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xDE000000),
                        fontFamily: "roboto_medium"),
                  )
                ],
              ),
              onTap: signOut,
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 170),
            ),
            new Column(
              children: [
                new Text("Version 1.3",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF0B2751),
                        fontFamily: "acme")),
                new GestureDetector(
                  onTap: () {
                    launch("https://ietvit.tech");
                  },
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text(
                        "Made with ",
                        style: TextStyle(
                            fontSize: 16,
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
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "pacifico"),
                      ),
                      new Image.asset(
                        "assets/images/iet_logo_blue.png",
                        width: 40,
                        height: 36,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: new Container(
        width: 56,
        height: 56,
        child: new FittedBox(
          child: new FloatingActionButton(
            backgroundColor: Color(0xFF28B9E4),
            onPressed: () {
              createAlertDialog(context, user.email);
            },
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
                      child: new Container(
                        alignment: Alignment.center,
                        height: 110,
                        width: queryData.size.width - 32,
                        child: new Text(
                          "No meetings upcoming",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue[800],
                              fontFamily: "poppins_semibold"),
                        ),
                      ),
                  ),
                ],
              ),
            ),
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
                  "Tasks to be done",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B2751),
                      fontFamily: "acme"),
                )
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 16),
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
                              padding: const EdgeInsets.all(50),
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
              padding: const EdgeInsets.only(top: 24),
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
              padding: const EdgeInsets.only(top: 16),
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
                              padding: const EdgeInsets.all(12),
                              child: new Row(
                                children: [
                                  new Card(
                                    child: new Image.asset("assets/images/event.png", width: 140, height: 100),
                                    elevation: 2,
                                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))
                                  ),
                                  new Column(
                                    children: [
                                      new Text(
                                        "Date to be announced",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.red,
                                            fontFamily: "poppins_semibold"),
                                      ),
                                      new Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                      ),
                                      new Text(
                                        "This is a SAMPLE Event",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF0B2751),
                                            fontFamily: "sans-serif"),
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
