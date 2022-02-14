import 'package:flutter/material.dart';
import 'package:openchat/src/screen/homepage.dart';

class ComFirmOTP extends StatefulWidget {
  ComFirmOTP({Key? key, required this.phone}) : super(key: key);

  String phone;

  @override
  State<ComFirmOTP> createState() => _ComFirmOTPState();
}

class _ComFirmOTPState extends State<ComFirmOTP> {
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
                      'ใส่รหัสยืนยัน',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'รหัสยืนยันอยู่ในข้อความใน SMS ที่ส่งไปยังหมายเลขโทรศัพท์ $phone',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 120),
                    const Text(
                      'รหัสยืนยัน',
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
                                  builder: (context) => const HomePage()));
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'ยืนยันหมายเลข OTP',
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
