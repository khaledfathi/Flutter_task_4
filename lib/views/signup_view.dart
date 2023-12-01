import 'package:flutter/material.dart';
import 'package:task_l4/controllers/auth_controller.dart';
import 'package:task_l4/views/components/divider_with%20label.dart';
import 'package:task_l4/views/components/social_media_row.dart';
import 'package:task_l4/views/components/structured_screen.dart';
import 'package:task_l4/views/components/text_form_field_custom.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  //fileds controllers
  TextEditingController nameCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController phoneCtl = TextEditingController();
  TextEditingController passwordCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.sizeOf(context).width;
    double fullHeight = MediaQuery.sizeOf(context).height;

    return StructuredScreen(
      title: 'Sign Up',
      subTitle: 'Sign up to discover amazing things near around to you ',
      fullHeight: fullHeight,
      fullWidth: fullWidth,
      dataBoxLeft: fullWidth * 0.1,
      dataBoxRight: fullWidth * 0.1,
      dataBoxTop: fullHeight * 0.25,
      dataBoxBottom: fullHeight * 0.1,
      dataBoxDecoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 350,
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
                TextFormFieldCustom(
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Full Name',
                  controller: nameCtl,
                ),
                TextFormFieldCustom(
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailCtl,
                ),
                TextFormFieldCustom(
                  prefixIcon: const Icon(Icons.phone_android_sharp),
                  hintText: 'Phone Number',
                  keyboardType: TextInputType.number,
                  controller: phoneCtl,
                ),
                TextFormFieldCustom(
                  prefixIcon: const Icon(Icons.password),
                  hintText: 'Password',
                  obscureText: true,
                  controller: passwordCtl,
                ),
                MaterialButton(
                  color: Colors.deepPurpleAccent,
                  minWidth: double.infinity,
                  onPressed: () async {
                    await AuthController().signUp(
                        name: nameCtl.text,
                        email: emailCtl.text,
                        phone: phoneCtl.text,
                        password: passwordCtl.text,
                        context: context);
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Text(
                  'By signing up you accept the terms and service privacy policy',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: const DividerWithLabel(
              text: 'Or connect using ',
              textFlex: 6,
            ),
          ),
          Container(
            height: 80,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 2), blurRadius: 5),
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, -2), blurRadius: 5),
                ]),
            child: SocialMediaRow(
              onTapPhone: () =>
                  Navigator.of(context).pushNamed('auth.loginWithNumber'),
            ),
          )
        ],
      ),
    );
  }
}
