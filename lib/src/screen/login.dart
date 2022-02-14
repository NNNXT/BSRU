import 'package:flutter/material.dart';
import 'package:openchat/src/screen/confirmotp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'เข้าสู่ระบบ OPENTALK',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'ใส่หมายเลขโทรศัพท์ของอุปกรณ์ที่คุณใช้อยู่ในขณะนี้',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'โปรดอ่านและยอมรับข้อกำหนดการใช้บริการและนโยบายความเป็นส่วนตัวของ OPENCHAT ก่อนใส่หมายเลขโทรศัพท์แล้วแตะปุ่มไปต่อ',
                      style: TextStyle(fontSize: 13, color: Color(0xFF888888)),
                    ),
                    const SizedBox(height: 120),
                    const Text(
                      'เบอร์โทรศัพท์',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'กรุณาใส่ข้อมูล';
                        }
                      },
                      onSaved: (newValue) {
                        phone = newValue;
                      },
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ComFirmOTP(phone: phone.toString())));
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'ยืนยันเบอร์โทรศัพท์',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
