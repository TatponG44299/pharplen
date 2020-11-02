import 'dart:io';
import 'dart:math';

import 'package:dormitory/sceen/dormFee.dart';
import 'package:dormitory/uinty/normalDialog.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Paydorm extends StatefulWidget {
  @override
  _PaydormState createState() => _PaydormState();
}

class _PaydormState extends State<Paydorm> {
  var  url;
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Phaplen Hotel',
          style: TextStyle(
              fontFamily: 'appname', color: Color(0xFFe3f6f5), fontSize: 32.0),
        ),
        backgroundColor: Color(0xFF1f4961),
      ),
      backgroundColor: Color(0xFF31749b),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            showText1(),
            showimage(),
            frame(),
            homepage(),
            paypage(),
          ],
        ),
      ),
    );
  }

  Widget paypage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 84,
              width: 215,
              child: FlatButton(
                color: Color(0xFF272643),
                onPressed: () {
                  // Navigator.pop(context);
                  // MaterialPageRoute route =
                  //     MaterialPageRoute(builder: (value) => Paydorm());
                  // Navigator.push(context, route);
                },
                child: Text('Pay',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget homepage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 84,
          width: 215,
          child: FlatButton(
            color: Color(0xFF272643),
            onPressed: () {
              Navigator.pop(context);
              MaterialPageRoute route =
                  MaterialPageRoute(builder: (value) => Homepage());
              Navigator.push(context, route);
            },
            child: Text('Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                )),
          ),
        ),
      ],
    );
  }

  Container frame() {
    return Container(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          constraints: BoxConstraints.expand(height: 350, width: 350),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            border: Border.all(color: Colors.black, width: 3.0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              showImage(),
              scbImages(),
              kungImages(),
              idSCB(),
              idkongt(),
              setImages(),
              upImages()
            ],
          ),
        ),
      ),
    );
  }

  Widget upImages() => Container(
        margin: EdgeInsets.only(right: 75, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    uploadFile();
                  },
                  child: Text('Update Image'),
                ),
              ],
            ),
          ],
        ),
      );

  Widget setImages() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.add_photo_alternate),
              iconSize: 65,
              color: Color(0xFF1f4961),
              onPressed: () {
                chooseFile(ImageSource.gallery);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget idSCB() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(right: 50, top: 75),
          child: Text(
            '123_456_789',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  Widget idkongt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(right: 50, top: 200),
          child: Text(
            '123_456_789',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  Widget scbImages() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40, left: 40),
          width: 80,
          height: 80,
          child: Image.asset('images/scb-icon.png'),
        ),
      ],
    );
  }

  Widget kungImages() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 170, left: 40),
          width: 80,
          height: 80,
          child: Image.asset('images/ktb-bank.png'),
        ),
      ],
    );
  }

  Container showimage() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: 130.0,
      height: 140.0,
      child: Image.asset(
        'images/coins.png',
      ),
    );
  }

  Widget showText1() {
    return Container(
      margin: EdgeInsets.only(
        top: 70,
        left: 80,
      ),
      alignment: Alignment.center,
      child: Text("ช่องทางชำระ",
          style: TextStyle(
              fontFamily: 'login',
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold)),
      constraints: BoxConstraints.expand(height: 50, width: 300),
      decoration: BoxDecoration(
        color: Colors.indigo[300],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        border: Border.all(color: Colors.black, width: 3.0),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Future chooseFile(ImageSource source) async {
    try {
      var object = await ImagePicker.pickImage(
          source: source, maxWidth: 800.0, maxHeight: 800.0);

      setState(() {
        _image = object;
      });
    } catch (e) {}
  }

  Future uploadFile() async {
    print('----------------');
    Random random = Random();
    int i = random.nextInt(1000);
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    StorageReference storageReference =
        firebaseStorage.ref().child('test/$i.jpg');
    StorageUploadTask storageUploadTask = storageReference.putFile(_image);

  
    print('==================$_image');
  }
  Widget showImage() {
    return Container(
      padding: EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.3,child: _image == null ? Text('') : Image.file(_image),
    );
  }
}
