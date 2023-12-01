import 'package:flutter/material.dart';
import 'package:task_l4/views/components/otp_field.dart';
import 'package:task_l4/views/components/structured_screen.dart';
import 'package:task_l4/views/new_password_view.dart';

class OTPView extends StatelessWidget {
  final int recordId ; 
  const OTPView({super.key , required this.recordId});

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.sizeOf(context).width;
    double fullHeight = MediaQuery.sizeOf(context).height;
    return StructuredScreen(
      title: 'Enter OTP',
      subTitle: 'Please enter 6 digits code sent to your registred mobile number xxxx7652',
      fullHeight: fullHeight,
      fullWidth: fullWidth,
      dataBoxTop: fullHeight * 0.3,
      dataBoxBottom: fullHeight * 0.4,
      dataBoxLeft: fullWidth * 0.1,
      dataBoxRight: fullWidth * 0.1,
      dataBoxDecoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        // width: double.infinity,
        // height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, offset: Offset(0, 2), blurRadius: 5),
              BoxShadow(
                  color: Colors.grey, offset: Offset(0, -2), blurRadius: 5),
            ]),
        child: Column(
          children: [
            const OTPField(),
            MaterialButton(
              color: Colors.deepPurpleAccent,
              minWidth: double.infinity,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewPasswordView(recordId: recordId)));
              },
              child: const Text(
                'Subbmit',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Not recived code',
                  textAlign: TextAlign.center,
                ),
                TextButton(onPressed: () {}, child: const Text('Resend')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
