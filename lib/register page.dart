import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: new SingleChildScrollView(
          child: new Column(
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
                padding: const EdgeInsets.only(top: 50),
              ),
              new Image.asset(
                "assets/images/ic_wave.png",
                width: queryData.size.width,
              ),
              new Container(
                height: queryData.size.height * 0.66,
                width: queryData.size.width,
                decoration: new BoxDecoration(
                  color: Color(0xFF57B7DF),
                ),
                child: new Column(
                  children: [
                    new Padding(padding: const EdgeInsets.only(top: 20)),
                    new Center(
                      child: new Text(
                        "Register with E-Mail",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFF0B2751),
                            fontWeight: FontWeight.bold,
                            fontFamily: "roboto_medium"),
                      ),
                    ),
                    new Padding(padding: const EdgeInsets.only(top: 25)),
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Container(
                            height: 60,
                            width: 350,
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: new TextField(
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  hintText: "E-Mail",
                                  hintStyle: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "poppins_semibold")),
                            )),
                        new Padding(
                          padding: const EdgeInsets.only(top: 20),
                        ),
                        new Container(
                            height: 60,
                            width: 350,
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: new TextField(
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "poppins_semibold")),
                            )),
                        new Padding(
                          padding: const EdgeInsets.only(top: 20),
                        ),
                        new GestureDetector(
                          child: new Container(
                              height: 60,
                              width: 350,
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              child: new TextField(
                                decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    hintText: "Confirm Password",
                                    hintStyle: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "poppins_semibold")),
                              )),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 110),
                        ),
                        new GestureDetector(
                          child: new Container(
                            width: 350,
                            height: 60,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                new Text(
                                  "REGISTER",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "sans-serif-medium"),
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
                          onTap: () {},
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
