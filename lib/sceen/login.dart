import 'package:dormitory/uinty/normalDialog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'dormFee.dart';

String member;

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  final db = FirebaseDatabase.instance.reference();


  String username,password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f4961),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              logoShow(),
              mySizebox1(),
              phaplenName(),
              mySizebox2(),
              useTextfield(),
              mySizebox1(),
              passTextfield(),
              mySizebox2(),
              loginButton()
            ],
          ),
        ),
      )),
    );
  }

  Widget loginButton() => Container(
        width: 250,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            onPressed: () {
              if (username == null ||
                  username.isEmpty ||
                  password == null ||
                  password.isEmpty) {
                normalDialog(context, 'Please fill in all fields.');
              } else {
                logincheck();
              }
            },
            color: Color(0xFFbae8e8),
            child: Text(
              'Login',
              style: TextStyle(
                  fontFamily: 'login', color: Colors.black, fontSize: 25.0),
            ),
          ),
        ),
      );

  Text phaplenName() => Text(
        'Phaplen Hotel',
        style: TextStyle(
            fontFamily: 'appname', color: Color(0xFFe3f6f5), fontSize: 40.0),
      );

  Container passTextfield() {
    return Container(
      width: 330,
      child: TextField(
        obscureText: true,
         onChanged: (value) => password = value.trim(),
        decoration: InputDecoration(
            fillColor: Colors.blue[100],
            filled: true,
            labelText: 'Password :',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }

  Container useTextfield() {
    return Container(
      width: 330,
      child: TextField(
         onChanged: (value) => username = value.trim(),
        decoration: InputDecoration(
            fillColor: Colors.blue[100],
            filled: true,
            labelText: 'Username :',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }

  Widget logoShow() {
    return Container(
      width: 130.0,
      height: 140.0,
      child: Image.asset('images/building.png'),
    );
  }

  // void logincheck() {
  //   print('object=====> ควย');
  //   FirebaseDatabase.instance
  //       .reference()
  //       .child('recent')
  //       .child('id')
  //       .set({'title': 'Realtime db rocks', 'created_at': 'time'});
  // }

  Future<void> logincheck() async {
    var data = db.child("Tenant");
    member = username; 
    await data.child(username).once().then((DataSnapshot snapshot) {
      print("${snapshot.value}");
      if ('${snapshot.value}' == 'null') {
        normalDialog(context, 'emailผิดดดดด');
      } else if (password == '${snapshot.value['Password']}') {
        MaterialPageRoute route = MaterialPageRoute(
          builder: (context) => Homepage(),
        );
        Navigator.pushAndRemoveUntil(context, route, (route) => false);
      } else {
        print('รหัสไม่ถูก');
        normalDialog(context, 'รหัสไม่ถูกต้อง กรุณากรอกใหม่');
      }
    });
  }


}

mySizebox1() => SizedBox(
      width: 8.0,
      height: 20.0,
    );

mySizebox2() => SizedBox(
      width: 8.0,
      height: 50.0,
    );

