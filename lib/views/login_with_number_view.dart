import 'package:flutter/material.dart';
import 'package:task_l4/controllers/auth_controller.dart';
import 'package:task_l4/views/components/divider_with%20label.dart';
import 'package:task_l4/views/components/otp_field.dart';
import 'package:task_l4/views/components/social_media_row.dart';
import 'package:task_l4/views/components/structured_screen.dart';
import 'package:task_l4/views/components/text_form_field_custom.dart';

class LoginWithNumberView extends StatefulWidget {

  const LoginWithNumberView({super.key});

  @override
  State<LoginWithNumberView> createState() => _LoginWithNumberViewState();
}

class _LoginWithNumberViewState extends State<LoginWithNumberView> {
  //field controllers 
  TextEditingController phoneCtl = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.sizeOf(context).width;
    double fullHeight = MediaQuery.sizeOf(context).height;
    return StructuredScreen(
        fullHeight: fullHeight,
        fullWidth: fullWidth,
        dataBoxTop: fullHeight * 0.28,
        dataBoxBottom: fullHeight * 0.2,
        dataBoxLeft: fullWidth * 0.1,
        dataBoxRight: fullWidth * 0.1,
        title: 'Login With Number',
        subTitle:
            'Your number will safe with us. we won\'t share your details with anyone.',
        dataBoxDecoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 2),
                        blurRadius: 5),
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, -2),
                        blurRadius: 5),
                  ]),
              child: Column(
                children: [
                  TextFormFieldCustom(
                    prefixIcon: const Icon(Icons.phone_android_sharp),
                    hintText: 'Enter Mobile Number',
                    keyboardType: TextInputType.number,
                    controller: phoneCtl,
                  ),
                  const OTPField(),
                  MaterialButton(
                    color: Colors.deepPurpleAccent,
                    minWidth: double.infinity,
                    onPressed: () {
                      AuthController().loginWithNumber(phone: phoneCtl.text , context: context);
                    },
                    child: const Text(
                      'Next',
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
            const DividerWithLabel(
              text: 'Or connect using',
              margin: EdgeInsets.all(10),
              textFlex: 6,
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 2),
                        blurRadius: 5),
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, -2),
                        blurRadius: 5),
                  ]),
              child: const SocialMediaRow(),
            )
          ],
        ));
  }
}
