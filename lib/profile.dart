import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final User user = FirebaseAuth.instance.currentUser;
  File _image;
  bool isImageThere = false;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        isImageThere = true;
      } else {
        print('No image selected.');
      }
    });
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Padding(
              padding: const EdgeInsets.only(top: 32),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Stack(
                  children: [
                    Center(
                      child: new Material(
                          child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: new CircleAvatar(
                              backgroundImage: isImageThere
                                  ? FileImage(_image)
                                  : AssetImage("assets/images/iet_logo.png"),
                              radius: 70.0,
                            ),
                          ),
                        ),
                      )),
                    ),
                    new GestureDetector(
                      child: new Padding(
                          padding: const EdgeInsets.only(left: 250, top: 10),
                          child: new Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment(1, 0),
                                    colors: [
                                      Color(0xFF57B7D7),
                                      Color(0xFF0B2751)
                                    ])),
                            child: new CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 20,
                              child: new Icon(
                                Icons.edit,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      onTap: getImage,
                    ),
                  ],
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 20),
                ),
                new Text(
                  "Test Account",
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF0B2751),
                      fontWeight: FontWeight.bold,
                      fontFamily: "berkshire_swash"),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 10),
                ),
                new Image.asset(
                  "assets/images/ic_wave.png",
                  width: queryData.size.width,
                ),
                new Container(
                  height: queryData.size.height * 0.52,
                  width: queryData.size.width,
                  decoration: new BoxDecoration(
                    color: Color(0xFF28B9E4),
                  ),
                  child: new Column(
                    children: [
                      new Padding(
                        padding: const EdgeInsets.only(top: 20),
                      ),
                      new Row(
                        children: [
                          new Padding(
                            padding: const EdgeInsets.only(left: 64),
                          ),
                          new Image.asset(
                            "assets/images/profile_email.png",
                            height: 36,
                            width: 36,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(left: 64),
                          ),
                          //new Padding(padding: const EdgeInsets.all(40)),
                          new Text(
                            "testing@test.com",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "acme"),
                          ),
                        ],
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 20),
                      ),
                      new Row(
                        children: [
                          new Padding(
                            padding: const EdgeInsets.only(left: 64),
                          ),
                          new Image.asset(
                            "assets/images/profile_phone.png",
                            height: 36,
                            width: 36,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(left: 64),
                          ),
                          //new Padding(padding: const EdgeInsets.all(40)),
                          new Text(
                            "9999900000",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "acme"),
                          ),
                        ],
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 20),
                      ),
                      new Row(
                        children: [
                          new Padding(
                            padding: const EdgeInsets.only(left: 64),
                          ),
                          new Image.asset(
                            "assets/images/profile_role.png",
                            height: 36,
                            width: 36,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(left: 64),
                          ),
                          //  new Padding(padding: const EdgeInsets.all(40)),
                          new Text(
                            "Board",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "acme"),
                          ),
                        ],
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 20),
                      ),
                      new Row(
                        children: [
                          new Padding(
                            padding: const EdgeInsets.only(left: 64),
                          ),
                          new Image.asset(
                            "assets/images/profile_secondary.png",
                            height: 36,
                            width: 36,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(left: 64),
                          ),
                          // new Padding(padding: const EdgeInsets.all(40)),
                          new Text(
                            "Secondary Role",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "acme"),
                          ),
                        ],
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 20),
                      ),
                      new Row(
                        children: [
                          new Padding(
                            padding: const EdgeInsets.only(left: 64),
                          ),
                          new Image.asset(
                            "assets/images/profile_timetable.png",
                            height: 36,
                            width: 36,
                          ),
                          //new Padding(padding: const EdgeInsets.all(40)),
                          new Padding(
                            padding: const EdgeInsets.only(left: 64),
                          ),
                          new Text(
                            "Timetable",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "acme"),
                          ),
                        ],
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 80),
                      ),
                      Visibility(
                        visible: isImageThere,
                        child: new GestureDetector(
                          child: new Container(
                            width: 350,
                            height: 60,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                new Text(
                                  "UPDATE",
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
                          onTap: () {
                            print("Hello");
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
