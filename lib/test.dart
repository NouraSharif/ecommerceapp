import 'package:ecommerceapp/core/functions/internetcheck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var resp;

  initialData() async {
    resp = await internetCheck();
    print(resp);
  }

  @override
  void initState() {
    initialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test'), centerTitle: true),
      body: OtpTextField(
        borderRadius: BorderRadius.circular(15),
        borderWidth: 4,
        numberOfFields: 5,
        borderColor: Color(0xFF512DA8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true,
        //runs when a code is typed in
        onCodeChanged: (String code) {
          //handle validation or checks here
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Verification Code"),
                content: Text('Code entered is $verificationCode'),
              );
            },
          );
        }, // end onSubmit
      ),
    );
  }
}
