import 'package:flutter/material.dart';
import 'sceen/dormFee.dart';
import 'sceen/login.dart';
import 'sceen/pay.dart';

//เมื่อโปรเจ็คทงาน Constructor Method หรือเม็ธตอดหลักทำการ call object จากคลาสตัวล่าง
void main() {
  runApp(MyApp());
}

//class ตัวนี้ดึง widget ที่มาจาก home มาแสดง
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: Loginpage(), //เริ่มต้นRun
    );
  }
}
