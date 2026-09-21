import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_project/views/about_ui.dart';
import 'package:flutter_body_health_calculator_project/views/bmi_ui.dart';
import 'package:flutter_body_health_calculator_project/views/bmr_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 
class HomeUI extends StatefulWidget {
  const HomeUI({super.key});
 
  @override
  State<HomeUI> createState() => _HomeUIState();
}
 
class _HomeUIState extends State<HomeUI> {
  // สร้างตัวแปรเก็บหน้าจอย่อยที่จะมาแสดงที่ body
  // ตัวแปรแบบ List คือ ตัวแปรที่เก็บได้มากกว่า 1 ค่าข้อมูล
  // โดยแต่ละค่าข้อมูลจะมี index number
  List subView = [
    BmiUi(),
    AboutUI(),
    BmrUI(),
  ];
 
  //สร้างตัวแปรเก็บหมายเลข index ของ item และ ui ที่เลือก
  int? selectIndex = 1;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ส่วนของ AppBar()
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Body Health Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      // ส่วนของ BottomNavigationBar()
      bottomNavigationBar: BottomNavigationBar(
        onTap: (paramValue){
          //โค้ดที่มีผลต่อการแสดงผลต้องเขียนอยู่ใน setState( ) ***
          setState(() {
            selectIndex = paramValue;
          });
        },
        currentIndex: selectIndex!,
        selectedItemColor: Colors.deepOrange,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.heartPulse,
            ),
            label: 'BMR',
          ),
        ],
      ),
      // ส่วนของ body
      body: subView[selectIndex!],
    );
  }
}