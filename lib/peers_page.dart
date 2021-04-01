import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ietvit_app/entities/User.dart' as entity_user;

class PeerPage extends StatefulWidget {
  @override
  _PeerState createState() => _PeerState();
}

class _PeerState extends State<PeerPage> {

  final User user = FirebaseAuth.instance.currentUser;
  List<entity_user.User> users = [];

  final databaseReference = FirebaseDatabase.instance.reference();
  Future<List<entity_user.User>> getAllUsers() async{
    DataSnapshot dataSnapshot = await databaseReference.child('Users/').once();
    if(dataSnapshot.value != null){
      dataSnapshot.value.forEach((key, value)  {
        entity_user.User user = entity_user.createUser(value);
        setState(() {
          users.add(user);
        });
      });
    }
    return [];
  }

  @override
  void initState() {
    getAllUsers();
    super.initState();
  }

  createAlertDialog(BuildContext context, String qr_data){
    return showDialog(context: context, builder: (context){
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
          child:
          new QrImage(
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

    return new Scaffold(
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
      body: users.isEmpty ? Center(child: new CircularProgressIndicator()) : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => new Container(
          child : new Card(
            child : new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Material(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: new CircleAvatar(
                              backgroundImage: 
                              users[index].Profile == null || users[index].Profile.isEmpty 
                                  ? AssetImage("assets/images/profile_image.jpg")
                              : new NetworkImage(users[index].Profile),
                              radius: 35.0,
                            ),
                          ),
                        ),
                      )
                  ),
                  new Text(users[index].Name,
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0B2751),
                        fontFamily: "poppins_semibold"),
                  ),
                  Material(
                      child: InkWell(
                        onTap: () {
                          launch(users[index].Github);
                        },
                        child: Container(
                          child: ClipRRect(
                            child: SvgPicture.asset("assets/icons/github.svg",
                                width: 24.0, height: 24.0),
                          ),),
                      )
                  ),
                  Material(
                      child: InkWell(
                        onTap: () {
                          launch(users[index].Instagram);
                        },
                        child: Container(
                          child: ClipRRect(
                            child: Image.asset("assets/images/insta_logo.png",
                                width: 24.0, height: 24.0),
                          ),),
                      )
                  ),
                  Material(
                      child: InkWell(
                        onTap: () {
                          launch(users[index].LinkedIn);
                        },
                        child: Container(
                          child: ClipRRect(
                            child: Image.asset("assets/images/linkedin_logo.png",
                                width: 24.0, height: 24.0),
                          ),),
                      )
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}