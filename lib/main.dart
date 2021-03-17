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
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Padding(
            padding: const EdgeInsets.only(top: 32),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Image.asset(
                "assets/images/iet_logo.png",
                height: 140,
                width: 140,
              ),
              new Image.asset(
                "assets/images/hackoff_logo.png",
                height: 140,
                width: 140,
              )
            ],
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 52),
          ),
          new Image.asset(
            "assets/images/ic_wave.png",
            width: queryData.size.width,
          ),
          new Container(
            height: queryData.size.height * 0.625,
            width: queryData.size.width,
            decoration: new BoxDecoration(color: Color(0xFF28B9E4)),
            child: new Column(
              children: [
                new Padding(padding: const EdgeInsets.only(top: 24)),
                new Center(
                  child: new Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 36,
                        color: Color(0xFF0B2751),
                        fontWeight: FontWeight.bold,
                        fontFamily: "roboto_medium"),
                  ),
                ),
                new Padding(padding: const EdgeInsets.only(top: 52)),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new Container(
                      height: 60,
                      width: 250,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
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
                              height: 32,
                              width: 32,
                            ),
                            new Text("Login with E-mail",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0B2751),
                                    fontFamily: "sans-serif"))
                          ],
                        ),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20),
                    ),
                    new Container(
                      height: 60,
                      width: 250,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: new Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        color: Colors.white,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new SvgPicture.asset(
                              "assets/icons/google.svg",
                              height: 32,
                              width: 32,
                            ),
                            new Text("Login with Google",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0B2751),
                                    fontFamily: "sans-serif"))
                          ],
                        ),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20),
                    ),
                    new Container(
                      height: 60,
                      width: 250,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
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
                              height: 32,
                              width: 32,
                            ),
                            new Text("Login with GitHub",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0B2751),
                                    fontFamily: "sans-serif"))
                          ],
                        ),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 80, right: 16),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                new Text(
                                  "REGISTER",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "sans-serif"),
                                ),
                              ],
                            ),
                            decoration: new BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                gradient: LinearGradient(colors: [
                                  Color(0xFF0B2751),
                                  Color(0xFF57B7D7)
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
    );
  }
}
