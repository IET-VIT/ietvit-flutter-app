import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ietvit_app/entities/User.dart' as entity_user;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final User users = FirebaseAuth.instance.currentUser;

  final databaseReference = FirebaseDatabase.instance.reference();
  Future<List<entity_user.User>> getAllUsers() async{
    print("Hello");
    DataSnapshot dataSnapshot = await databaseReference.child('Users/').once();
    List<entity_user.User> users = [];
    if(dataSnapshot.value != null){
      dataSnapshot.value.forEach((key, value)  {
        entity_user.User user = entity_user.createUser(value);
        users.add(user);
        print(user.Name);
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

    MediaQueryData queryData = MediaQuery.of(context);

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
        width: 70,
        height: 70,
        child: new FittedBox(
          child: new FloatingActionButton(
            focusColor: Color(0xFF28B9E4),
            onPressed: () {
              createAlertDialog(context, users.email);
            },
            child: new Padding(
              padding: const EdgeInsets.all(15),
              child: new Image.asset("assets/images/qr_code.png"),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
      children: [
        new Container(
          child : new Card(

            child : new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[
                  new Material(
                      child: InkWell(
                        child: Container(
                        child: new CircleAvatar(

                            child:new Image.asset("assets/images/profile_image.jpg",fit: BoxFit.fill),
                            radius: 35.0,


                        ),
                        ),
                      )
                  ),

                  new Text('Bhavya Goel',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0B2751),
                        fontWeight: FontWeight.bold,
                        fontFamily: "popins_semibold"),
                  ),
                  Material(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          child: ClipRRect(
                            child: Image.asset("assets/images/insta_logo.png",
                                width: 20.0, height: 20.0),
                          ),),
                      )
                  ),
                  Material(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          child: ClipRRect(
                            child: Image.asset("assets/images/linkedin_logo.png",
                                width: 20.0, height: 20.0),
                          ),),
                      )
                  ),
                  Material(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          child: ClipRRect(
                            child: SvgPicture.asset("assets/icons/github.svg",
                                width: 20.0, height: 20.0),
                          ),),
                      )
                  ),
                  //


                ]
            ),
          ),
        ),
      ],
      ),
    );
  }


}
/*
class CircularImage extends StatelessWidget {
  final String imagePath;

  CircularImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.teal, width: 10.0, style: BorderStyle.solid),
          image: new DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/iet_logo.png",)
          )
      ),
    );
  }
  }

 */

/* new Image.asset(
                    "assets/images/iet_logo.png",
                    height: 80,
                    width: 80,
                  ), */