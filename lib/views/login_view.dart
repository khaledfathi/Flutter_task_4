import 'package:flutter/material.dart';
import 'package:task_l4/controllers/auth_controller.dart';
import 'package:task_l4/views/components/divider_with%20label.dart';
import 'package:task_l4/views/components/social_media_row.dart';
import 'package:task_l4/views/components/structured_screen.dart';
import 'package:task_l4/views/components/text_form_field_custom.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //field controllers
  TextEditingController emailCtl = TextEditingController(); 
  TextEditingController passwordCtl = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.sizeOf(context).width;
    double fullHeight = MediaQuery.sizeOf(context).height;
    return StructuredScreen(
      fullHeight: fullHeight,
      fullWidth: fullWidth,
      dataBoxTop: fullHeight * 0.3,
      dataBoxBottom: fullHeight * 0.2,
      dataBoxLeft: fullWidth * 0.1,
      dataBoxRight: fullWidth * 0.1,
      title: 'Sign In',
      subTitle: 'Sign in to discover amazing things near around to you ',
      dataBoxDecoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Container(
            height: 230,
            padding: const EdgeInsets.all(10),
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
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailCtl,
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
                  onPressed: ()async {
                    await AuthController().login(
                      context: context,
                      email: emailCtl.text,
                      password: passwordCtl.text                      
                    );
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('auth.recoverAccount');
                  },
                  child: const Text('Forget password? '),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: const DividerWithLabel(
              text: 'Or connect using',
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
