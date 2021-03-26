import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffkey = GlobalKey<ScaffoldState>();
  String mail;
  String password;
  String confirmPass;

  Future<void> signUp() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      if (confirmPass == password) {
        await Firebase.initializeApp();
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mail, password: confirmPass);
        Navigator.pop(context);
      } else {
        final snackb = new SnackBar(
            backgroundColor: Colors.red,
            duration: new Duration(seconds: 4),
            content: new Text("The two password dosen't match each other :(",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: "poppins_semibold")));
        scaffkey.currentState.showSnackBar(snackb);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
        key: scaffkey,
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
                height: queryData.size.height * 0.65,
                width: queryData.size.width,
                decoration: new BoxDecoration(
                  color: Color(0xFF28B9E4),
                ),
                child: new Column(
                  children: [
                    new Padding(padding: const EdgeInsets.only(top: 10)),
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
                    new Padding(padding: const EdgeInsets.only(top: 45)),
                    new Form(
                      key: formKey,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          new Container(
                              height: 60,
                              width: 350,
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: new TextFormField(
                                autocorrect: false,
                                decoration: new InputDecoration(
                                    prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 15),
                                        child: Image.asset(
                                          "assets/images/email.png",
                                          width: 40,
                                          height: 40,
                                        )),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 25,
                                      minHeight: 25,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFF0B2751)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFF878787)),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 25),
                                    labelText: "E-Mail",
                                    labelStyle: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "poppins_semibold")),
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) => val.contains("@")
                                    ? null
                                    : "Enter Valid Mail ID",
                                onSaved: (val) => mail = val,
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
                                      BorderRadius.all(Radius.circular(20))),
                              child: new TextFormField(
                                autocorrect: false,
                                obscureText: true,
                                decoration: new InputDecoration(
                                    prefixIcon: Image.asset(
                                        'assets/images/password.png'),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFF0B2751)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFF878787)),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 25),
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "poppins_semibold")),
                                keyboardType: TextInputType.name,
                                validator: (val) => val.length < 6
                                    ? "Enter Bigger Password"
                                    : null,
                                onSaved: (val) => password = val,
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
                                      BorderRadius.all(Radius.circular(20))),
                              child: new TextFormField(
                                autocorrect: false,
                                obscureText: true,
                                decoration: new InputDecoration(
                                    prefixIcon: Image.asset(
                                        'assets/images/password.png'),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFF0B2751)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFF878787)),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 25),
                                    labelText: "Confirm Password",
                                    labelStyle: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "poppins_semibold")),
                                keyboardType: TextInputType.name,
                                validator: (val) => val.length < 6
                                    ? "Enter Bigger Password"
                                    : null,
                                onSaved: (val) => confirmPass = val,
                              )),
                          new Padding(
                            padding: const EdgeInsets.only(top: 90),
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
                            onTap: signUp,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
