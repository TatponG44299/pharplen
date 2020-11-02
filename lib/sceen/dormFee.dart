import 'package:dormitory/sceen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'pay.dart';

class Homepage extends StatefulWidget {
  Homepage({this.app});
  final FirebaseApp app;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final database = FirebaseDatabase.instance.reference();

  var idRoom, payE, payW, payR, payO, payT, moth,id;

  @override
  void initState() {
   database.child('Tenant').child(member).once().then((DataSnapshot showroom) {
      // print(showroom.value['IDRoom']);
      idRoom = showroom.value['IDRoom'];
      getData();
    });

    super.initState();
  }

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
                  Navigator.pop(context);
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (value) => Paydorm());
                  Navigator.push(context, route);
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
              // Navigator.pop(context);
              // MaterialPageRoute route =
              //     MaterialPageRoute(builder: (value) => Homepage());
              // Navigator.push(context, route);
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
            children: <Widget>[
              showmoth(),
              showID(),
              priceRoom(),
              priceE(),
              priceW(),
              priceO(),
              priceT(),
              price(),
              price1(),
              price2(),
              price3(),
              price4(),
              baht(),
              baht1(),
              baht2(),
              baht3(),
              baht4(),
              room(),
            ],
          ),
        ),
      ),
    );
  }

  Widget priceRoom() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 115),
      child: Row(
        children: [
          Text(
            'ค่าห้อง',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget priceE() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 155),
      child: Row(
        children: [
          Text(
            'ค่าไฟ',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget priceW() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 195),
      child: Row(
        children: [
          Text(
            'ค่าน้ำ',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget priceO() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 235),
      child: Row(
        children: [
          Text(
            'อื่นๆ',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget price() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 115, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'บาท',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget price1() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 155, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'บาท',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget price2() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 195, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'บาท',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget price3() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 235, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'บาท',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget price4() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 290, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'บาท',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget priceT() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 290),
      child: Row(
        children: [
          Text(
            'รวม',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget showID() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 75),
      child: Row(
        children: [
          Text(
            'หมายเลขห้อง',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget showmoth() => Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("เดือน", style: TextStyle(color: Colors.black, fontSize: 25)),
            GestureDetector(
              onTap: () {},
              child: Text(
                ' $moth',
                style: TextStyle(color: Colors.blue[800], fontSize: 25),
              ),
            ),
          ],
        ),
      );

  Container showimage() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: 130.0,
      height: 140.0,
      child: Image.asset(
        'images/money-bag.png',
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
      child: Text("ค่าหอรายเดือน",
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

  Widget baht() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 120, right: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '$payR',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget baht1() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 160, right: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '$payE',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget baht2() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 200, right: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '$payW',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget baht3() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 240, right: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '$payO',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget baht4() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 295, right: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '$payT',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget room() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 80, right: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '$idRoom',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Future getData() async {
    print(idRoom);
    database.child('PriceRoom').child(idRoom).once().then((DataSnapshot troom) {
      //print(troom.value['PriceEletric']);
      payE = troom.value['PriceEletric'];
      payO = troom.value['PriceOther'];
      payR = troom.value['PeiceRoom'];
      payT = troom.value['Total'];
      payW = troom.value['PriceWater'];
      moth = troom.value['Month'];
    });

    //print(idRoom);
    //FirebaseAnimatedList(query: null, itemBuilder: null);
  }
}
