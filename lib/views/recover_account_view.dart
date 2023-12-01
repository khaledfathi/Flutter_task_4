import 'package:flutter/material.dart';
import 'package:task_l4/controllers/auth_controller.dart';
import 'package:task_l4/views/components/structured_screen.dart';
import 'package:task_l4/views/components/text_form_field_custom.dart';

class RecoverAccountView extends StatefulWidget {
  const RecoverAccountView({super.key});

  @override
  State<RecoverAccountView> createState() => _RecoverAccountViewState();
}

class _RecoverAccountViewState extends State<RecoverAccountView> {
  //field controllers 
  TextEditingController phoneCtl = TextEditingController(); 
  TextEditingController emailCtl = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.sizeOf(context).width;
    double fullHeight = MediaQuery.sizeOf(context).height;
    return StructuredScreen(
      fullHeight: fullHeight,
      fullWidth: fullWidth,
      title: 'Recover your Password',
      subTitle:
          'Select credentials wich should we use to recover your Password.',
      dataBoxTop: fullHeight * 0.28,
      dataBoxBottom: fullHeight * 0.4,
      dataBoxRight: fullWidth * 0.1,
      dataBoxLeft: fullWidth * 0.1,
      dataBoxDecoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        width: double.infinity,
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
              prefixIcon: const Icon(Icons.phone_android_sharp),
              hintText: 'Enter mobile number',
              controller: phoneCtl,
            ),
            TextFormFieldCustom(
              prefixIcon: const Icon(Icons.email),
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              controller: emailCtl,
            ),
            MaterialButton(
              color: Colors.deepPurpleAccent,
              minWidth: double.infinity,
              onPressed: () {
                AuthController().passwordRecovery(
                  context: context,
                  email: emailCtl.text,
                  phone: phoneCtl.text
                );
                // Navigator.of(context).pushNamed('auth.otp');
              },
              child: const Text(
                'Recover Password',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
