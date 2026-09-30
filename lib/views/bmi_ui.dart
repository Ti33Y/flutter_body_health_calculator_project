import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  //สร้างัวแปลควบคุมเทคฟิว
  TextEditingController _weightCtrl =TextEditingController();
  TextEditingController _hightCtrl =TextEditingController();

double _bmi = 0;
String _result = "การแปลผล";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(55.0),

          child: Center(
            child: Column(
              children: [

                // หัวข้อ
                Text(
                  'คำนวณดัชนีมวลกาย\n(BMI)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF555555),
                  ),
                ),

                SizedBox(height: 15),

                // รูป BMI
                Image.asset(
                  'assets/images/bmi.png',
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),

                SizedBox(height: 15),

                // น้ำหนัก
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg.)',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),

                SizedBox(height: 4),

                SizedBox(
                  height: 48,
                  child: TextField(
                    controller: _weightCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'กรอกน้ำหนักของคุณ',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // ส่วนสูง
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm.)',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),

                SizedBox(height: 4),

                SizedBox(
                  height: 48,
                  child: TextField(
                    controller: _hightCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'กรอกส่วนสูงของคุณ',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // กรอบปุ่มคำนวณ
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      // ป้อมครบมั้ย
                      if(_weightCtrl.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar
                        (SnackBar(
                          content: Text('การุณากรอกน้ำหนัก'),
                          backgroundColor: Colors.red),
                        );
                        return;
                      }

                      // ป้อมครบมั้ย
                      if(_hightCtrl.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar
                        (SnackBar(
                          content: Text('การุณากรอกส่วนสูง'),
                          backgroundColor: Colors.red),
                        );
                        return;
                      }  

                      //แปลงค่าคำนวณ
                      double w = double.parse(_weightCtrl.text);
                      double h = double.parse(_hightCtrl.text);
                      
                      // แสดดงผลใช้ setState
                      setState(() {
                        _bmi = w / ((h/100)*(h/100));
                      });

                      if(_bmi < 18.5){
                        _result = "ผอม";
                      }else if(_bmi < 22.9){
                        _result = "ปกติ";
                      }else if(_bmi < 24.9){
                        _result = "อ้วน1";
                      }else if(_bmi < 29.9){
                        _result = "อ้วน2";
                      }  
  

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF5722),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'คำนวณ BMI',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 8),

                // กรอบปุ่มล้างข้อมูล
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      //ลบค่า bmi result
                      setState(() {
                        _weightCtrl.text = '';
                        _hightCtrl.text = '';
                        _bmi =0;
                        _result ='การ';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB8B8BE),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'ล้างข้อมูล',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // กรอบผลลัพธ์ BMI
                Container(
                  width: double.infinity,
                  height: 140,
                  color: const Color(0xFFC5E7C6),

                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                          'BMI',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          _bmi.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),

                        Text(
                          _result,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}