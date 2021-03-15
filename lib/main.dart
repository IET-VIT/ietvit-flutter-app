import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ietvit_app/register%20page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(brightness: Brightness.light),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: new SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Padding(
                padding: const EdgeInsets.only(top: 50),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new Image.asset(
                    "assets/images/iet_logo.png",
                    height: 150,
                    width: 200,
                  ),
                  new Image.asset(
                    "assets/images/hackoff_logo.png",
                    height: 150,
                    width: 200,
                  )
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 100),
              ),
              new Container(
                height: 595,
                width: 500,
                decoration: new BoxDecoration(
                    color: Color(0xFF57B7DF),
                    borderRadius: new BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                child: new Column(
                  children: [
                    new Padding(padding: const EdgeInsets.all(10)),
                    new Center(
                      child: new Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 45,
                            color: Color(0xFF0B2751),
                            fontFamily: "poppins_semibold"),
                      ),
                    ),
                    new Padding(padding: const EdgeInsets.only(top: 25)),
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Container(
                          height: 60,
                          width: 300,
                          decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: new Card(
                            shape: new RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            color: Colors.white,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                new SvgPicture.asset(
                                  "assets/icons/email.svg",
                                  height: 40,
                                  width: 30,
                                ),
                                new Text("Login with E-mail",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF0B2751),
                                        fontFamily: "poppins_semibold"))
                              ],
                            ),
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 20),
                        ),
                        new Container(
                          height: 60,
                          width: 300,
                          decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: new Card(
                            shape: new RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            color: Colors.white,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                new SvgPicture.asset(
                                  "assets/icons/pichai.svg",
                                  height: 40,
                                  width: 30,
                                ),
                                new Text("Login with Google",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF0B2751),
                                        fontFamily: "poppins_semibold"))
                              ],
                            ),
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 20),
                        ),
                        new Container(
                          height: 60,
                          width: 300,
                          decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: new Card(
                            shape: new RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            color: Colors.white,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                new SvgPicture.asset(
                                  "assets/icons/github.svg",
                                  height: 40,
                                  width: 30,
                                ),
                                new Text("Login with GitHub",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF0B2751),
                                        fontFamily: "poppins_semibold"))
                              ],
                            ),
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 140),
                        ),
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            new GestureDetector(
                              child: new Container(
                                width: 140,
                                height: 40,
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    new Text(
                                      "REGISTER",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: "poppins_semibold"),
                                    ),
                                  ],
                                ),
                                decoration: new BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF0B2751),
                                      Color(0xFFAAD6EA)
                                    ])),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            RegPage()));
                              },
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
