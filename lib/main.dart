import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ietvit_app/authentication_provider.dart';
import 'package:ietvit_app/home_page.dart';
import 'package:ietvit_app/register_page.dart';
import 'package:ietvit_app/login_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(brightness: Brightness.light),
        home: new MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomePage();
    }
    return OptionsPage();
  }
}

class OptionsPage extends StatefulWidget {
  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
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
                  height: 120,
                  width: 120,
                ),
                new Image.asset(
                  "assets/images/hackoff_logo.png",
                  height: 120,
                  width: 120,
                )
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 54),
            ),
            new Image.asset(
              "assets/images/ic_wave.png",
              width: queryData.size.width,
            ),
            new Container(
              height: queryData.size.height * 0.66,
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
                      GestureDetector(
                        child: new Container(
                          height: 60,
                          width: 250,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginPage()));
                        },
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 20),
                      ),
                      new Container(
                        height: 60,
                        width: 250,
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
      ),
    );
  }
}
